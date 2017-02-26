class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # app/controllers/application_controller.rb
  before_action :require_login

  # app/controllers/users_controller.rb
  skip_before_action :require_login, only: [:index, :new, :create]

  # app/controllers/user_sessions_controller.rb
  skip_before_action :require_login, except: [:destroy]
end
