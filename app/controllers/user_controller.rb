class UserController < ApplicationController
  # app/controllers/users_controller.rb
  skip_before_action :require_login, only: [:new, :create]

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
    @user_auth = UserAuth.new(user_auth_params)
    @prefectures = Prefecture.order(:sort)
    @categories  = Category.order(:sort)
    if params[:genre_ids].blank?
      params[:genre_ids] = []
    end

    @user.user_auth = @user_auth

    if @user.valid?
      @user_genres = []

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

      @user_auth = login(@user_auth.email, params[:user_auth][:password])
      redirect_to :action => "show", :id => @user.id
    else
      render :action => "new"
    end
  end


  def complete
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_param
      params.require(:user).permit(:name, :profile, :prefecture_id, :gender)
    end
    # Use callbacks to share common setup or constraints between actions.
    def user_auth_params
      params.require(:user_auth).permit(:email, :password, :password_confirmation)
    end

end
