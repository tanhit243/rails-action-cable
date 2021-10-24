# frozen_string_literal: true

Rails.application.routes.draw do
  root 'examples#index'

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resource :example, only: :index
  resources :messages do
    resources :comments
  end
end
