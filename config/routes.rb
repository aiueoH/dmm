Rails.application.routes.draw do 
  root "items#index"
  
  devise_for :users
  
  resources :orders
  resources :receivers
  resources :items
end
