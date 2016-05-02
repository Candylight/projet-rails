
class HsCard < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :hs_class
end