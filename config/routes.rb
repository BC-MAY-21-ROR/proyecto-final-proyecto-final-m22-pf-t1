Rails.application.routes.draw do
  root 'home#index'
  resources :stylists
  resources :businesses
  resources :catalogs
end
