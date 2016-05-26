class Deck < ActiveRecord::Base
  has_many :deck_hs_cards
  has_many :hs_cards, through: :deck_hs_cards
  belongs_to :hs_class
  belongs_to :user
  acts_as_commontable
end
