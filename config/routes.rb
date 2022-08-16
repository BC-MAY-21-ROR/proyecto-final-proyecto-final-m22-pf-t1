Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :invoices do
	  resources :order_items
	end

  resources :invoices do
	  resources :payments
	end

  get 'reports/index' => 'reports#index'
  get 'reports/daily' => 'daily'
  get 'reports/monthly' => 'monthly'
  get 'reports/weekly' => 'weekly'
  get 'reports/comissions'=>'comissions'

  resources :deductions
  resources :stylists
  resources :businesses
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  resources :dashboard
  end
  