# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signin', to: 'session#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'session#destroy'
  root 'method#input'
  get 'method/input'
  get 'method/view'
  get 'session/destroy'
  resources :session, only: %i[new create destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
