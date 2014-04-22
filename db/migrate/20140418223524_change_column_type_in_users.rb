class ChangeColumnTypeInUsers < ActiveRecord::Migration
  def up
    change_column :users, :admin_privileges, 'integer USING CAST(admin_privileges AS integer)'
  end

  def down
    change_column :users, :admin_privileges, :string
  end
end
