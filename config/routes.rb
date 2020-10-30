Rails.application.routes.draw do
  # resources :joiners
  # resources :options
  # resources :programs
  # resources :users
  # resources :reviews
  # resources :schools
  # resources :neighborhoods
  # resources :boroughs

  get "/schools", to: "schools#index"
  get "/keep_logged_in", to: "users#keep_logged_in"
  post "/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
