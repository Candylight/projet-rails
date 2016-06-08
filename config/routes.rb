Rails.application.routes.draw do
  resources :decks do
    resources :hs_cards, only: [] do
      delete 'remove'
    end
  end
  devise_for :admins
  devise_for :users
  resources :groups
  resources :types
  resources :extensions
  resources :hs_classes
  resources :rarities
  root 'home#index'
  resources :hs_cards
  resources :home
  mount Commontator::Engine => '/commontator'
end