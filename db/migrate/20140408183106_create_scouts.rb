class CreateScouts < ActiveRecord::Migration
  def change
    create_table :scouts do |t|
    	t.string :name
    	t.integer :troop_id
    	t.string :grade
    	t.date :birthday
    	t.string :email
    	t.string :phone_number
    	t.string :admin_privileges
    	t.integer :dues
    	t.integer :profile_photo

      t.timestamps
    end
  end
end
