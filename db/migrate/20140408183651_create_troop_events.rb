class CreateTroopEvents < ActiveRecord::Migration
  def change
    create_table :troop_events do |t|
        t.integer :event_id
        t.integer :troop_id
        t.datetime :date
        t.string :location
        t.text :detail

        t.timestamps
    end
  end
end
