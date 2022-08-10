Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :invoices do
	  resources :order_items
	end

 
  get 'reports/daily_report' => 'daily_report'
  get 'reports/monthly_report' => 'monthly_report'
  get 'reports/weekly_report' => 'we_report'

  resources :deductions
  resources :stylists
  resources :businesses
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  resources :dashboard
  end
  