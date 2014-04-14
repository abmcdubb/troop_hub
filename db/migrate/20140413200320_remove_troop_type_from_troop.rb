class RemoveTroopTypeFromTroop < ActiveRecord::Migration
  def change
    remove_column :troops, :troop_type, :string
  end
end
