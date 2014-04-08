class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
        t.integer :adult_id
        t.string :name
        t.string :description
        t.boolean :badge_related_skill, default: false

        t.timestamps
    end
  end
end
