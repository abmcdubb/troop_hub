class RemoveBadgesFromScout < ActiveRecord::Migration
  def change
    remove_column :scouts, :badges, :text
  end
end
