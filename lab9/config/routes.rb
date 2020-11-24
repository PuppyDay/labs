Rails.application.routes.draw do
  root 'method#input'
  get 'method/input'
  get 'method/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
