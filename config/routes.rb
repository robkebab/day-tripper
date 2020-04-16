Rails.application.routes.draw do
  get 'welcome/index'

  #sessions 
  get 'login', to: 'sessions#new', as: "login"
  post "login", to: "sessions#create"
  delete 'login', to: 'sessions#destroy', as: 'logout'

  #trips
  resources :trips
  post '/trips/:id/add_driver', to: "trips#add_driver", as: 'add_driver'
  post '/trips/:id/add_passenger', to: "trips#add_passenger", as: 'add_passenger'
  
  delete '/trips/:id/destroy_passenger', to: "trips#destroy_passenger", as: 'destroy_passenger'
  delete '/trips/:id/destroy_driver', to: "trips#destroy_driver", as: 'destroy_driver'

  #locations
  resources :locations, only: [:show, :index]

  #users
  get '/home', to: 'users#home'
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, except: [:new]

  #cars
  resources :cars
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
