class AddAttachementToEntities < ActiveRecord::Migration
  def change
    remove_column :hs_cards, :picture
    remove_column :hs_classes, :picture
    remove_column :rarities, :picture
    remove_column :extensions, :picture
    remove_column :groups, :picture
    remove_column :types, :picture

    add_attachment :hs_cards, :picture
    add_attachment :hs_classes, :picture
    add_attachment :rarities, :picture
    add_attachment :extensions, :picture
    add_attachment :groups, :picture
    add_attachment :types, :picture
  end
end
