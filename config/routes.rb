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
  resources :hs_classes do
    collection do
      get 'get_hs_cards' => 'hs_classes#get_hs_cards'
    end
  end

  resources :rarities
  root 'home#index'
  resources :hs_cards
  resources :home
  mount Commontator::Engine => '/commontator'
end