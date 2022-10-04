Rails.application.routes.draw do
  get 'pets/index'
  get 'pets/show'
  root 'home#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    password: 'users/password',
    registrations: 'users/registrations'
  }
  resources :home
end
