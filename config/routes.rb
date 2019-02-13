Rails.application.routes.draw do
  devise_for :users

  get 'homes/index'
  
  root to: 'homes#index'
  
  resources :courses do
    resources :comments, only: :create
  end
end
