Rails.application.routes.draw do
  resources :homes, only: [:index]
  resources :sessions, only: [:new, :create, :delete]
  root 'homes#index'
end
