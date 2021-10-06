# frozen_string_literal: true

Rails.application.routes.draw do
  root 'examples#index'

  devise_for :users

  resource :example, only: :index
  resources :messages do
    resources :comments
  end
end
