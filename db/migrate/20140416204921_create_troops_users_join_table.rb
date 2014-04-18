class CreateTroopsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :troops_users, id: false do |t|
      t.integer :user_id
      t.integer :troop_id
    end
  end

end
