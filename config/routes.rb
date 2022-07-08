Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :stylists
  resources :businesses
  resources :catalogs
end
