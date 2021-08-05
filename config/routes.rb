# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#index'
  resources :products, only: %i[index show]
  resources :orders, only: %i[index create]
  get 'orders/add_product', to: 'orders#add_product'
  get '/orders/show_cart', to: 'orders#show_cart'
end
