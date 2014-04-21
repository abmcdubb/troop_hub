class ChangeColumnTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin_privileges, :integer
  end
end
