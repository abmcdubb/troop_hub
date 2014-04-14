class RenameAdultSkillsToUserSkills < ActiveRecord::Migration
  def change
    rename_table :adult_skills, :user_skills
  end
end
