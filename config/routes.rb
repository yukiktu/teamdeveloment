Rails.application.routes.draw do





devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :admin_users, controllers: {
       sessions: 'admin_users/sessions',
       registrations: 'admin_users/registrations',
       passwords: 'admin_users/passwords'
}

devise_for :end_users, controllers: {
       sessions: 'end_users/sessions',
       registrations: 'end_users/registrations',
       passwords: 'end_users/passwords'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :labels
resources :end_users
resources :cart_items
resources :orders
resources :items
resources :arrivals, only: [:index, :edit, :update, :create, :destroy]
resources :numbers
get 'search' => 'admin_users#search'
get 'itemkensaku' => 'admin_users#itemkensaku'
get 'kensaku' => 'items#kensaku'
get 'sales' => 'orders#sales'
resources :admin_users
get 'about' => 'items#about'
get 'admin_search' => 'admin_users#search', as: "admin_search"
get 'itiran' => 'admin_users#itiran'
#resources :arrivals



# devise_for :users, controllers: {
#         sessions: 'users/sessions'
# }




end
