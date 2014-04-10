class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :item1_title
      t.text :item1_desc
      t.string :item2_title
      t.text :item2_desc
      t.string :item3_title
      t.text :item3_desc
      t.text :note_from_leader
      t.string :leader
      t.timestamps
    end
  end
end
