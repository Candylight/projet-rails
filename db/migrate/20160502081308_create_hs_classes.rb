class CreateHsClasses < ActiveRecord::Migration
  def change
    create_table :hs_classes do |t|
      t.string :name
      t.string :color
      t.string :hero_power

      t.timestamps null: false
    end
  end
end
