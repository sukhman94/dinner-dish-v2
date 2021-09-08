# frozen_string_literal: true

Rails.application.routes.draw do
  resources :carts, only: %i[index create update destroy]
  resources :categories, except: :show
  resources :items do
    member do
      delete :delete_image_attachment
    end
  end
  resources :restaurants
  devise_for :users, controllers: { sessions: 'custom_sessions' }
  resources :orders
  root 'welcome#index'
end
