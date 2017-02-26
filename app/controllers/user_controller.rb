class UserController < ApplicationController
  def index
    @user = User.new
    @genre = Genre.new
    @prefectures = Prefecture.order(:sort)
    @categories = Category.order(:sort)
  end

  def confirm
    @user = User.new(user_param)
    print params
    if !@user.valid?
      @prefectures = Prefecture.order(:sort)
      @categories = Category.order(:sort)
      render :action => "index"

    end
  end

  def complete

  end

  private def user_param
    params.require(:user).permit(:name, :profile, :prefecture_id, :gender)
  end

end
