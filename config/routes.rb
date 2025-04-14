# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[show create new] do
    scope module: :posts do
      resources :comments, only: :create
    end
  end
end
