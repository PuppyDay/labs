# frozen_string_literal: true

Rails.application.routes.draw do
  root 'method#input'
  get 'method/input'
  get 'method/view'
  get 'method/results'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
