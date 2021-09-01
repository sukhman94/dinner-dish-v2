# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, except: :show
  resources :items
  resources :restaurants, except: :show
  devise_for :users
  root 'welcome#index'
end
