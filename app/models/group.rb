class Group < ActiveRecord::Base
  has_many :hs_cards
  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
