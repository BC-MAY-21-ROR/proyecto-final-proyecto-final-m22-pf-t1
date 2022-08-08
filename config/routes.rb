Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :invoices do
	  resources :order_items
	end

<<<<<<< HEAD
=======
  post "reports/invoice_daily_report"=> "reports#invoice_daily_report"
    
	 
>>>>>>> de8ed140b0667e476edbfce3a44b7eb8813124bf
  resources :deductions
  resources :stylists
  resources :businesses
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  resources :dashboard
  resources :reports
  
  end
