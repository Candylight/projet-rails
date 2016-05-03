class AddClassesToHsCards < ActiveRecord::Migration
  def change
    add_reference :hs_cards, :hs_class, index: true, foreign_key: true
  end
end
