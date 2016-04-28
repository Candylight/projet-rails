Rails.application.routes.draw do
  root 'home#index'
  resources :hs_cards
end