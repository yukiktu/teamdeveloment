Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :labels
resources :end_users
resources :cart_items
resources :orders
resources :items
resources :arrivals, only: [:index, :edit, :update, :create, :destroy]
#resources :arrivals
end
