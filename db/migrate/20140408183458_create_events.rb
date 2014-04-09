class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.string :season
      t.string :one_time
      t.string :location

      t.timestamps
    end
  end
end
