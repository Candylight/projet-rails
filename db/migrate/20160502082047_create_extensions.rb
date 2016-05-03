class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name
      t.timestamp :release
      t.boolean :standard

      t.timestamps null: false
    end
  end
end
