Rails.application.routes.draw do 
  root "items#index"
  
  devise_for :users, :skip => :registration # 取消使用者自行註冊功能
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :orders
  resources :receivers
  resources :items
end
