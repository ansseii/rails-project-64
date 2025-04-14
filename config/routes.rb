# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  post 'locale', to: 'locales#update', as: :set_locale

  resources :posts, only: %i[show create new] do
    scope module: :posts do
      resources :comments, only: :create
      resources :likes, only: %i[create destroy]
    end
  end
end
