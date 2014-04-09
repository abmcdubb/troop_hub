class CreateEventAgeLevels < ActiveRecord::Migration
  def change
    create_table :event_age_levels do |t|
      t.integer :event_id
      t.integer :age_level_id

      t.timestamps
    end
  end
end
