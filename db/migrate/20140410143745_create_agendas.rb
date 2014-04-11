class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :name
      t.text :description
      t.date :meeting_date #enter a meeting date
      t.string :location #location/place of meeting -- field trip or regular location
      t.text :activity_1 #start-up activity/craft, as scouts arrive
      t.text :activity_2 #opening
      t.text :activity_3 #business
      t.text :activity_4 #activities
      t.text :activity_5
      t.text :activity_6
      t.text :activity_7 #clean-up
      t.text :activity_8 #closing
      t.string :patches #relevant badges/patches
      t.string :snack #snack
      t.text :jobs #kaper/job assignments, if applicable
      t.text :supplies #need to buy, bring
      t.text :correspondence #calls/emails to make
      t.text :troop_info #info/material to share with girls
      t.text :parent_info #info/material to share with parents
      t.text :decisions #girl decisions for next meeting

      t.timestamps
    end
  end
end
