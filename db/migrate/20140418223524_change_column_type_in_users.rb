class ChangeColumnTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin_privileges, :integer,  default: 100
  end
end
