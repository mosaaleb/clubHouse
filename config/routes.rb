# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  resources :homes, only: [:index]
  resource :session, only: %i[new create destroy]
  root 'homes#index'
end
