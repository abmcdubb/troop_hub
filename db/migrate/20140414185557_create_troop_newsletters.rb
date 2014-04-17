class CreateTroopNewsletters < ActiveRecord::Migration
  def change
    create_table :troop_newsletters do |t|
      t.integer :troop_id
      t.integer :newsletter_id
    end
  end
end
