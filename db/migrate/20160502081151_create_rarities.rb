class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
