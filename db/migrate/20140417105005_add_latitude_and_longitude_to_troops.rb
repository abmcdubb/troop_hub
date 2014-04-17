class AddLatitudeAndLongitudeToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :latitude, :float
    add_column :troops, :longitude, :float
  end
end