# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: redirect('products')
  resources :products, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
