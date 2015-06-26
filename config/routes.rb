Rails.application.routes.draw do
  
  # root 'students#index'

  root "home#index"

  resources :students

  resources :users, only: [:new, :create, :index, :show]

  resources :courses

  resources :projects, only: [:new, :create]


  # resources :sessions
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'

end
