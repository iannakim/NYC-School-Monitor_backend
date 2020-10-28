Rails.application.routes.draw do
  resources :joiners
  resources :options
  resources :programs
  resources :users
  resources :reviews
  resources :schools
  resources :neighborhoods
  resources :boroughs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
