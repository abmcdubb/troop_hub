module UsersHelper

  def add_skills_to_adults(user_id, skill_ids, skill_descriptions)
    skill_ids.each do |skill_id|
      UserSkill.create(skill_id: skill_id, user_id: user_id, skill_description: skill_descriptions[skill_id.to_i - 1])
    end
  end

  def add_comma_seperated_skills_to_adults(user_id, skill_ids, skill_descriptions)
    skill_ids.each do |skill_id|
      if skill_descriptions[skill_id.to_i - 1] != ""
        skill_descriptions[skill_id.to_i - 1].split(",").each do |skill_description|
          UserSkill.create(skill_id: skill_id.to_i, user_id: user_id, skill_description: skill_description)
        end
      else
        UserSkill.create(skill_id: skill_id.to_i, user_id: user_id, skill_description: skill_descriptions[skill_id.to_i - 1])
      end
    end
  end

  def remove_skills(user_skill_ids)
    user_skill_ids.each do |user_skill_id|
      UserSkill.find(user_skill_id.to_i).destroy
    end
  end

  def placeholder(skill_name)
    case skill_name
    when "Music"
      "Viola, Piano, Flute"
    when "Health & Safety"
      "CPR, Bike Safety"
    when "Cooking"
      "Baking, Stir Fry, BBQ"
    when "Outdoor Skills"
      "Camping, Fishing, Hunting"
    when "Arts & Crafts"
      "Origami, Painting"
    when "Math"
      "Division, Algebra, Statistics"
    when "Computer Science"
      "Ruby on Rails, HTML"
    when "Sports & Fitness"
      "Basketball, Kickbox"
    when "Drama"
      "Theatre, Set"
    when "Dance"
      "Tap, Breakdance, Ballet"
    when "Geography & Culture"
      "Maps, Anthropology"
    when "Community Service"
      "Volunteer Work, Finding Need"
    when "Technology"
      "Computers, Microwaves"
    when "Engineering"
      "Electrical, Mechanical"
    when "Science"
      "Biology, Chemistry"
    when "Astronomy"
      "Planetary Rotations"
    when "Financial Literacy"
      "Investment Strategies, Calculating Tips"
    when "Career Exploration"
      "Interviews, Job Search"
    when "Plants & Gardening"
      "Farming, Home Garden"
    when "Animals"
      "Wild, Domestic, Amphibians"
    when "Climate/Earth Science"
      "Geology, Recycling"
    when "Habitat Restoration"
      "Animal Habitats"
    when "OTHER"
      "Parkour, Marketing"
    #for additional functionality
    when "Folk Dance & Games"
      "Salsa, Chess"
    when "Sewing, Needle Arts"
      "Knitting, Crochet"
    when "Other"
      "Parkour, Marketing"
    when "Nature, Ecology"
      "Bird Watching, Recycling"
    when "Photography"
      "Black & White, Still Life, SLR"


    end

  end

  def grade_level
    [
      ['Kindergarten'],
      ['1st'],
      ['2nd'],
      ['3rd'],
      ['4th'],
      ['5th'],
      ['6th'],
      ['7th'],
      ['8th'],
      ['9th'],
      ['10th'],
      ['11th'],
      ['12th'],
    ]
  end

end
