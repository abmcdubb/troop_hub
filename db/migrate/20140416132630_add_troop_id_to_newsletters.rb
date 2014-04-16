class AddTroopIdToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :troop_id, :integer
  end
end
