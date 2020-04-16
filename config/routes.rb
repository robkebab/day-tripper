Rails.application.routes.draw do
  get 'welcome/index'

  #sessions 
  get 'login', to: 'sessions#new', as: "login"
  post "login", to: "sessions#create"
  delete 'login', to: 'sessions#destroy', as: 'logout'

  #trips
  resources :trips
  post '/trips/:id/add_passenger', to: "trips#add_passenger", as: 'add_passenger'
  post '/trips/:id/add_driver', to: "trips#add_driver", as: 'add_driver'

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
