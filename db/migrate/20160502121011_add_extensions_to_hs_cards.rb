class AddExtensionsToHsCards < ActiveRecord::Migration
  def change
    add_reference :hs_cards, :extension, index: true, foreign_key: true
  end
end
