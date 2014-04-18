class AddTroopTypeAndPhotoToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :troop_type, :string
    add_column :troops, :photo, :string
  end
end
