class CreateAdultSkills < ActiveRecord::Migration
  def change
    create_table :adult_skills do |t|
      t.integer :adult_id
      t.integer :skill_id
      t.string :skill_description

      t.timestamps
    end
  end
end
