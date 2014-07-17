class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  def self.all_descriptions_for(user_id, skill_id)
    all_des = []
    where(user_id: user_id, skill_id: skill_id).each do |user_skill|
      all_des<<user_skill.skill_description
    end
    all_des.join(",")
  end

end