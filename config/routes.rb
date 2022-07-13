Rails.application.routes.draw do
  resources :customers
  devise_for :users
  root 'home#index'
  resources :stylists
  resources :businesses
  resources :catalogs
end
