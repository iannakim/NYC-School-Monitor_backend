Rails.application.routes.draw do
  resources :saveds
  # resources :joiners
  # resources :options
  # resources :programs
  resources :users
  # resources :reviews
  # resources :schools
  # resources :neighborhoods
  # resources :boroughs

  get "/schools", to: "schools#index"
  get "/keep_logged_in", to: "users#keep_logged_in"

  post "/login", to: "users#login"
  post "/signup", to: "users#create"

  post "/review", to: "reviews#create"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#delete"


  post "/save", to: "saveds#create"
  get "/getSaved", to: "saveds#index"
  delete "/deleteSaved/:id", to: "saveds#delete"

end
