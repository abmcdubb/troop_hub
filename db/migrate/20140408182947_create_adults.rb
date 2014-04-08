class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
      t.integer :troop_id
      t.string :adult_role #parent, volunteer, or troop leader
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :profile_photo
      t.string :special_skills
      t.string :admin_privileges #can create and add content once logged in

      t.timestamps
    end
  end
end
