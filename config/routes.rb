Rails.application.routes.draw do 
  root "items#index"
  resources :orders
  resources :receivers
  resources :items
end
