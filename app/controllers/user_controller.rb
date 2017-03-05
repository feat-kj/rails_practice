class UserController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_master
  before_action :set_user, only: [:show, :edit, :update, :complete]
  before_action :bad_login, only: [:new, :create]

  def new
    @user = User.new
    params[:genre_ids] = []
  end

  def create
    puts params
    @user = User.new(user_params)
    @user_auth = UserAuth.new(user_auth_params)
    @user.user_auth = @user_auth

    if @user.valid?
      User.transaction do
        @user.save!
        if params[:genre_ids].present?
          @user_genres = []
          for genre_id in params[:genre_ids]
            user_genre = UserGenre.new
            user_genre.genre_id = genre_id.to_i
            user_genre.user_id = @user.id
            user_genre.save!
            @user_genres.push(user_genre)
          end
        end
      end
      @user_auth = login(@user_auth.email, params[:user_auth][:password])
      redirect_to :action => "show"
      
    else
      if params[:genre_ids].blank?
        params[:genre_ids] = []
      end
      render :action => "new"
    end
  end

  def edit
    params[:genre_ids] = []
    @user.genres.each do |g|
      params[:genre_ids].push(g.id.to_s)
    end
  end

  def update
    User.transaction do
      if @user.update(user_params)
        UserGenre.where(user_id: @user.id).destroy_all
        if params[:genre_ids].present?
          @user_genres = []
          for genre_id in params[:genre_ids]
            user_genre = UserGenre.new
            user_genre.genre_id = genre_id.to_i
            user_genre.user_id = @user.id
            user_genre.save!
            @user_genres.push(user_genre)
          end
        end
      else
        if params[:genre_ids].blank?
          params[:genre_ids] = []
        end
        render :action => "edit"
        return
      end
    end
    current_user.email = @user_auth.email
    redirect_to :action => "show"

    rescue => e
      render :text => e.message
  end

  def complete
  end

  def show
  end

  private
    def set_user
      user_id = current_user.user_id
      @user = User.find(user_id)
      @user_auth = @user.user_auth
    end

    def set_master
      @prefectures = Prefecture.order(:sort)
      @categories = Category.order(:sort)
    end

    def user_params
      params.require(:user).permit(:name, :profile, :prefecture_id, :gender)
    end

    def user_auth_params
      params.require(:user_auth).permit(:email, :password, :password_confirmation)
    end

    def bad_login
      if current_user
        logout
      end
    end


end
