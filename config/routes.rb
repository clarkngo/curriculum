Rails.application.routes.draw do
  devise_for :users

  get 'homes/index'
  
  root to: 'homes#index'
  
  resources :courses
end
