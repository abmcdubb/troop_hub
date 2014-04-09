class RemoveDescriptionAndAdultIdFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :description, :string
    remove_column :skills, :adult_id, :integer
  end
end
