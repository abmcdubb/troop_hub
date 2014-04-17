class DropTroopsUsersJoinTable < ActiveRecord::Migration
  def change
    drop_table :troops_users
  end
end
