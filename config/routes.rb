# frozen_string_literal: true

Rails.application.routes.draw do
  resources :carts
  post '/updatecart', to: 'carts#update'
  resources :categories, except: :show
  resources :items do
    member do
      delete :delete_image_attachment
    end
  end
  resources :restaurants, except: :show
  devise_for :users
  root 'welcome#index'
end
