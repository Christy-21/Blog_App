require 'sidekiq/web'
Rails.application.routes.draw do
     mount Sidekiq::Web => "/sidekiq"
  get 'sessions/destroy'
  devise_for :users
  resources :articles
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'pages/home'
  get 'pages/about'
  
     root 'pages#home'
     get 'about', to: 'pages#about'
     delete 'users/sign_out', to: 'sessions#destroy'
     get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'

     get '/signup', to: 'users#new'
     post '/signup', to: 'users#create'
    
end


