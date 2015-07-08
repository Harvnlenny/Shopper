Rails.application.routes.draw do
  
  get 'carts/show'

  get 'carts/update'

  get 'carts/receipt'

  resources :items
  resources :lists
  resources :users
  resources :carts
  patch '/cart', to: 'carts#update', as: 'update_cart'
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
