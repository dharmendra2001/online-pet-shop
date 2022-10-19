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
  get 'payment/:pet_id/:price', to: "home#payment", as: "payment"
  post 'charge', to: "home#charge", as: "charge"
  get 'buy_pet', to: "home#buy_pet", as: "buy_pet" 
  get 'medical_certificate/:id', to: "pets#medical_certificate", as: "medical_certificate"
  delete 'destroy_method/:id', to: 'petshops#destroy_method', as: "destroy_method"
  delete 'user_destroy/:id', to: 'home#user_destroy', as: "user_destroy"
  get 'balance/:id', to: 'home#balance', as: "balance"

end
