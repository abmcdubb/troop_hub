class DropScouts < ActiveRecord::Migration
  def change
    drop_table :scouts
  end
end
