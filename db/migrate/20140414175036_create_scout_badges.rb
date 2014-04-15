class CreateScoutBadges < ActiveRecord::Migration
  def change
    create_table :scout_badges do |t|
      t.integer :scout_id
      t.integer :badge_id

      t.timestamps
    end
  end
end
