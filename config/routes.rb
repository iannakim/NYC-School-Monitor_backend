Rails.application.routes.draw do
  # RESTful routing [all actions and HTTP methods]
  resources :saveds
  resources :users

  #custom routes
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
