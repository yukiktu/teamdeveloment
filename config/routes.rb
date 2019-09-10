Rails.application.routes.draw do
  get 'items/new'
  get 'items/index'
  get 'items/create'
  get 'items/show'
  get 'items/update'
  devise_for :admin_users
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
