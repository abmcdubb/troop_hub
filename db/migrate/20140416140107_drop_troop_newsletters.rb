class DropTroopNewsletters < ActiveRecord::Migration
  def change
    drop_table :troop_newsletters
  end
end
