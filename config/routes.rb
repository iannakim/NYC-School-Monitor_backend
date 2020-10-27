Rails.application.routes.draw do
  resources :sls
  resources :sas
  resources :sses
  resources :ses
  resources :lang_classes
  resources :ap_courses
  resources :school_sports
  resources :ell_programs
  resources :users
  resources :reviews
  resources :schools
  resources :neighborhoods
  resources :boroughs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
