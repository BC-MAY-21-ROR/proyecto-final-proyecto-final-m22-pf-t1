Rails.application.routes.draw do
  resources :stylists
  resources :businesses
  resources :order_items
  resources :invoices
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  root 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  
end
