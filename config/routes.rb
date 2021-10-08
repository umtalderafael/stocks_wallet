Rails.application.routes.draw do 
    
  devise_for :users
  resources :users

  resources :transactions
  resources :investments
  resources :investment_types
  resources :brokers
  resources :transaction_types      
  resources :fundamental_info, only: %i[index new create destroy]

  get 'home/index'
  root to: "home#index"

end
