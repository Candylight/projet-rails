class AddatributesToHsCards < ActiveRecord::Migration
  def change
    add_column :hs_cards, :description, :text
  end
end
