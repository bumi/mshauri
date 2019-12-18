# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: %i[show create index] do
      collection do
        get :me
      end
    end
    resources :answers, only: [:create]
    resources :iteration_answers, only: %i[index create]
    resources :questions, only: %i[index show]
    resources :iterations, only: %i[index show create]
    resources :recommendations, only: %i[index show]
  end

  resources :users, only: [:create]
  # entry point for the vue.js
  get '/:user_slug', to: 'home#index', as: :home
  get '/:user_slug/i/:iteration_id/questions/:question_id', to: 'home#index', as: :iteration_question
  get '/:user_slug/i/:iteration_id/recommendations', to: 'home#index', as: :recommendations
  get '/:user_slug/*path', to: 'home#index'

  root to: 'home#welcome'
end
