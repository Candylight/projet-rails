Rails.application.routes.draw do
  resources :extensions
  resources :hs_classes
  resources :rarities
  root 'home#index'
  resources :hs_cards
  resources :home
end