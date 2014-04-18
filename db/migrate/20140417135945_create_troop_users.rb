class CreateTroopUsers < ActiveRecord::Migration
  def change
    create_table :troop_users do |t|
      t.integer :troop_id
      t.integer :user_id
      t.timestamps
    end
  end
end
