class AddPatchesToScouts < ActiveRecord::Migration
  def change
    add_column :scouts, :patches, :text
  end
end
