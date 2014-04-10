class RemoveEmailFromScouts < ActiveRecord::Migration
  def change
    remove_column :scouts, :email, :string
  end
end
