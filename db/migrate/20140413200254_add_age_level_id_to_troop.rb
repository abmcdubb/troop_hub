class AddAgeLevelIdToTroop < ActiveRecord::Migration
  def change
    add_column :troops, :age_level_id, :integer
  end
end
