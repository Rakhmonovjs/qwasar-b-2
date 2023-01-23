Rails.application.routes.draw do
  root 'main#index'
  devise_for :users
  resources :documents
  resources :lists
  resources :bucks
  resources :buckets
  resources :projects do
    resources :buckets
    resources :lists
  resources :documents
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
