class CreateHsCards < ActiveRecord::Migration
  def change
    create_table :hs_cards do |t|
      t.string :name
      t.integer :cost
      t.integer :attack_points
      t.integer :life_points
    end
  end
end
