class RemoveColumnsFromNewsletters < ActiveRecord::Migration
  def change
    remove_column :newsletters, :troop_type, :string
    remove_column :newsletters, :troop_name, :string

  end
end
