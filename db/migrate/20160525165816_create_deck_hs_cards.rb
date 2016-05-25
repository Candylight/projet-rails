class CreateDeckHsCards < ActiveRecord::Migration
  def change
    create_table :deck_hs_cards do |t|
      t.integer :deck_id
      t.integer :hs_card_id

      t.timestamps null: false
    end
  end
end
