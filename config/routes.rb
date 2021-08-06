# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#index'

  resources :products, only: %i[index show]

  resources :orders, only: :index do
    collection do
      get :add_product
      get :show_cart
      get :pay
    end
  end
end
