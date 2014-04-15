class DropScoutBadges < ActiveRecord::Migration
  def change
  	drop_table :scout_badges
  end
end
