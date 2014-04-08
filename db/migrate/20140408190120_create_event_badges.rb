class CreateEventBadges < ActiveRecord::Migration
  def change
    create_table :event_badges do |t|
      t.integer :event_id
      t.integer :badge_id

      t.timestamps
    end
  end
end
