Rails.application.routes.draw do
  get '/about/index', to: 'about#index'
  
  root 'books#index'

  resources :books
  resources :categories
  resources :authors
  resources :publishers
end
