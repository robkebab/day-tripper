Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'

  #trips
  resources :trips

  #locations
  resources :locations

  #users
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, except: [:new]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
