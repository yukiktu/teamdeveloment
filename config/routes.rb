Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :end_users
  get '/cart_items/', to: 'cart_items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :end_users
  resources :cart_items
  resources :orders
  resources :items
end

