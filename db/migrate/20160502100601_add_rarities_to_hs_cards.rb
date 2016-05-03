class AddRaritiesToHsCards < ActiveRecord::Migration
  def change
    add_reference :hs_cards, :rarity, index: true, foreign_key: true
  end
end
