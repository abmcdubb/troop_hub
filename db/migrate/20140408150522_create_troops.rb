class CreateTroops < ActiveRecord::Migration
  def change
    create_table :troops do |t|
      t.string :name
      t.string :number
      t.string :troop_type
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :meetup_location
      t.text :about_us
      
      t.timestamps
    end
  end
end
