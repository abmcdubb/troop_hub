class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :pic
      t.string :hovertext
      t.integer :photoable_id
      t.string :photoable_type

      t.timestamps
    end
  end
end
