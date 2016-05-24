Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :types
  resources :extensions
  resources :hs_classes
  resources :rarities
  root 'home#index'
  resources :hs_cards
  resources :home
end