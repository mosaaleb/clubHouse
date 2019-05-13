# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, only: %i[new create index show]
  resources :homes, only: [:index]
  resource :session, only: %i[new create destroy]
  root 'homes#index'
end
