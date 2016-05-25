class AddImageToAllEntities < ActiveRecord::Migration
  def change
    add_column :hs_cards, :picture, :text
    add_column :hs_classes, :picture, :text
    add_column :rarities, :picture, :text
    add_column :extensions, :picture, :text
    add_column :groups, :picture, :text
    add_column :types, :picture, :text
  end
end
