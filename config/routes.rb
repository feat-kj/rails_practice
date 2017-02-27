Rails.application.routes.draw do

  root :to => 'users#index'
  resources :user_sessions
  resources :user_auths

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  get 'user/new'

  post 'user/confirm'

  post 'user/create'

  get 'user/complete'

  get 'user/:id',  to: 'user#show', as: 'user_show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
