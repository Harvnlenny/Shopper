Rails.application.routes.draw do

  resources :items
  resources :list_items, :only => [:create, :update, :destroy]
  resources :lists
  resources :users, :only => [:index, :show]

  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
