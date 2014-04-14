class RenameAdultIdToUserIdForAdultSkills < ActiveRecord::Migration
  def change
    rename_column :user_skills, :adult_id, :user_id
  end
end
