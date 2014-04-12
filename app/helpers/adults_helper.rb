module AdultsHelper

  def add_skills_to_adults(adult_id, skill_ids, skill_descriptions)
    skill_ids.each do |skill_id|
      AdultSkill.create(skill_id: skill_id, adult_id: adult_id, skill_description: skill_descriptions[skill_id.to_i - 1])
    end
  end

  def placeholder(skill_name)
    case skill_name
    when "Music"
      "Viola, Piano, Flute"
    when "Health & Safety"
      "CPR, Bike Safety"
    when "Cooking"
      "i.e.Baking, Stir Fry"
    when "Outdoor Skills"
      "Camping, Fishing"
    when "Nature, Ecology"
      "Bird Watching, Recycling"
    when "Photography"
      "Black & White, Still Life, SLR"
    when "Arts & Crafts"
      "Origami, Painting"
    when "Math"
      "Division, Algebra, Statistics"
    when "Computers"
      "Ruby on Rails, HTML"
    when "Folk Dance & Games"
      "Salsa, Chess"
    when "Sewing, Needle Arts"
      "Knitting, Crochet"
    when "Other"
      "Parkour, Marketing"
    end

  end

end
