module AdultsHelper

  def add_skills_to_adults(adult_id, skill_ids, skill_descriptions)
    skill_ids.each do |skill_id|
      AdultSkill.create(skill_id: skill_id, adult_id: adult_id, skill_description: skill_descriptions[skill_id.to_i - 1])
    end
  end

end
