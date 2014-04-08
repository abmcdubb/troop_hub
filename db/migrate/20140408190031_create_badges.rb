class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :troop_type
      t.string :category
      t.string :logo
      t.text :description

      t.timestamps
    end
  end
end
