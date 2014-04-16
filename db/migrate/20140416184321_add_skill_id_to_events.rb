class AddSkillIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :skill_id, :integer
  end
end
