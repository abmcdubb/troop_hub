class RemoveColumnFromUsers< ActiveRecord::Migration
  def change
    remove_column :users, :troop_id, :integer
  end
end
