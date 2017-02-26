Rails.application.routes.draw do
  get 'user/new'

  post 'user/confirm'

  post 'user/create'

  get 'user/complete'

  # get 'user/show/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
