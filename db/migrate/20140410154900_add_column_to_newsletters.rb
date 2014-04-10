class AddColumnToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :troop_type, :string
  end
end
