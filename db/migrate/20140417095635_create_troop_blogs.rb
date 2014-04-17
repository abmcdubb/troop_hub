class CreateTroopBlogs < ActiveRecord::Migration
  def change
    create_table :troop_blogs do |t|
      t.integer :troop_id
      t.string :headline
      t.text :body
      t.string :photo

      t.timestamps
    end
  end
end
