class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.integer :mark
      t.integer :views
    end
  end
end
