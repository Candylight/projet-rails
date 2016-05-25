class DeckHsCard < ActiveRecord::Base
  belongs_to :hs_card
  belongs_to :deck
end
