Rails.application.routes.draw do

  get 'spots/index'

  get 'spots/list'

  get 'spots/conditions'

  get 'spots/show'

  root :to => 'users#index'
  resources :user_sessions
  resources :user_auths

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  get 'user/',  to: 'user#show', as: 'user_show'

  get 'user/show'

  get 'user/new'

  get 'user/edit'

  post 'user/confirm'

  post 'user/create'

  patch 'user/update'
  post 'user/update'

  get 'user/complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
