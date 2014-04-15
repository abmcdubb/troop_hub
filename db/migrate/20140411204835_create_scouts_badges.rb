class CreateScoutsBadges < ActiveRecord::Migration
  def change
    create_table :scouts_badges do |t|
      t.index :scout_id
      t.index :badge_id

      t.timestamps
    end
  end
end
