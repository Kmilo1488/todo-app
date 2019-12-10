# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :employees, only: %i[new create]
  resources :activities, only: %i[new create edit update]

  root to: 'application#home'
end
