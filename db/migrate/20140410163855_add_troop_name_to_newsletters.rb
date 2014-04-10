class AddTroopNameToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :troop_name, :string
  end
end
