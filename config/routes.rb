# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:show] do
      collection do
        get :me
      end
    end
    resources :answers, only: [:create]
    resources :questions, only: [:show]
    resources :iterations, only: %i[show create]
  end

  # entry point for the vue.js
  get '/:user_slug', to: 'home#index'

  root to: 'home#welcome'
end
