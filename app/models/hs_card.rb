
class HsCard < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :hs_class
  belongs_to :extension
  belongs_to :type
  belongs_to :group
end