Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  patch 'pokemons/:id/capture', to: 'pokemons#capture', as: 'capture'
  patch 'pokemons/:id/damage', to: 'pokemons#damage', as: 'damage'
  get 'pokemons/new', to: 'pokemons#new', as: 'new'
  post 'pokemons/create', to: 'pokemons#create', as: 'create'
end
