class AddGroupsAndTypesToHsCards < ActiveRecord::Migration
  def change
    add_reference :hs_cards, :type, index: true, foreign_key: true
    add_reference :hs_cards, :group, index: true, foreign_key: true
  end
end
