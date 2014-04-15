class CreateBadgeAgeLevels < ActiveRecord::Migration
  def change
    create_table :badge_age_levels do |t|
      t.references :badge, index: true
      t.references :age_level, index: true

      t.timestamps
    end
  end
end
