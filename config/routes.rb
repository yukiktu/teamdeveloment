Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :end_users
  get '/cart_items/', to: 'cart_items#index'
  # resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# <<<<<<< HEAD
# resources :items
resources :labels
# =======
  resources :end_users
  resources :cart_items
  resources :orders
  resources :items

# >>>>>>> d93e7231977a4fb586ec1e590655a6a985814c81
end



