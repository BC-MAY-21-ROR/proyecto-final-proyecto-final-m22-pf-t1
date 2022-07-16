Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :stylists
  resources :businesses
  resources :order_items
  resources :invoices
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  
end
