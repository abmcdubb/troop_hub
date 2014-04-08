class CreateTroopEventBadges < ActiveRecord::Migration
  def change
    create_table :troop_event_badges do |t|
      t.integer :troop_event_id
      t.integer :badge_id

      t.timestamps
    end
  end
end
