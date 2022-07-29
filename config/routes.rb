Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

   resources :invoices do
	 resources :order_items
	end
	 
 resources :stylists
  resources :businesses
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  
end
