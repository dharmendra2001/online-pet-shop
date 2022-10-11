Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    password: 'users/password',
    registrations: 'users/registrations'
  }
  resources :home
  resources :pets, except: %i[create]
  resources :petshops, except: %i[create]
  post '/petshops/new', to: 'petshops#create'
  post '/pets/new', to: 'pets#create'
  get 'payment/:pet_id', to: "home#payment", as: "payment"
  post 'charge', to: "home#charge", as: "charge"

end
