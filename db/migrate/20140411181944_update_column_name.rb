class UpdateColumnName < ActiveRecord::Migration
  def change
  	rename_column :scouts, :patches, :badges
  end
end
