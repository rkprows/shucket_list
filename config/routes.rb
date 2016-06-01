Rails.application.routes.draw do
  get 'items/index'

  get 'items/show'

  get 'items/edit'

  get 'items/new'

  get 'lists/index'

  get 'lists/show'

  get 'lists/edit'

  get 'lists/new'

  root 'home#index'

  devise_for :users

end
