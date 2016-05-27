class AddAssociationsToDecks < ActiveRecord::Migration
  def change
    add_reference :decks, :hs_class, index: true, foreign_key: true
    add_reference :decks, :user, index: true, foreign_key: true
  end
end
