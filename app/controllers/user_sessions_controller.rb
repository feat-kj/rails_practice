class UserSessionsController < ApplicationController
  # app/controllers/user_sessions_controller.rb
  skip_before_action :require_login, except: [:destroy]

  def new
    @user_auth = UserAuth.new
  end

  def create
    if @user_auth = login(params[:email], params[:password])
       redirect_back_or_to(user_new_path, notice: 'Login successful')
     else
       flash.now[:alert] = 'Login failed'
       render action: 'new'
     end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'Logged out!')
  end


end
