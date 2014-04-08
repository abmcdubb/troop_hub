class RemoveColumn < ActiveRecord::Migration
  def self.up
  	remove_column :scouts, :profile_photo
  end
end
