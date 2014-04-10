class RemoveEmailFromAdults < ActiveRecord::Migration
  def change
    remove_column :adults, :email, :string
  end
end
