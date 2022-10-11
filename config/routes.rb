# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :members, only: %i[new create show edit update destroy]
end
