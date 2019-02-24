Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :registrations => :registrations }

  get 'homes/index'
  
  root to: 'homes#index'
  
  resources :courses do
    resources :comments, only: :create
  end
  
  resources :dashboard, only: :index, :format => false

end
