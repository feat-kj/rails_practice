class UserController < ApplicationController
  def new
    @user = User.new
    params[:genre_ids] = []
    @prefectures = Prefecture.order(:sort)
    @categories = Category.order(:sort)
  end

  def confirm
    @user = User.new(user_param)
    print params
    if !@user.valid?
      @prefectures = Prefecture.order(:sort)
      @categories = Category.order(:sort)
      render :action => "new"
    end
  end

  def create
    @user = User.new(user_param)
    @prefectures = Prefecture.order(:sort)
    @categories  = Category.order(:sort)
    if params[:genre_ids].blank?
      params[:genre_ids] = []
    end

    @user_genres = []
    for genre_id in params[:genre_ids]
      @user_genres.push(user_genre)
    end
    print @user_genres.count

    if @user.valid?
      User.transaction do
        @user.save!
        @user_genres = []
        for genre_id in params[:genre_ids]
          user_genre = UserGenre.new
          user_genre.genre_id = genre_id.to_i
          user_genre.user_id = @user.id
          user_genre.save!
          @user_genres.push(user_genre)
        end
      end
      redirect_to :action => "show", :id => @user.id

    else
      render :action => "new"
    end

  end


  def complete

  end

  def show
    @user = User.find(params[:id])
  end

  private def user_param
    params.require(:user).permit(:name, :profile, :prefecture_id, :gender)
  end

end
