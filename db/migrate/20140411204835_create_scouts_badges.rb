class CreateScoutsBadges < ActiveRecord::Migration
  def change
    create_table :scouts_badges do |t|

      t.timestamps
    end
  end
end
