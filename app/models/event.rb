class Event < ActiveRecord::Base

  has_many :troop_events
  has_many :troops, through: :troop_events

  has_many :event_badges, dependent: :destroy
  has_many :badges, through: :event_badges, dependent: :destroy

  has_many :event_age_levels, dependent: :destroy
  has_many :age_levels, through: :event_age_levels, dependent: :destroy
  belongs_to :skill

  validates :name, :presence => true 
  validates :skill_id, :presence => true
  validates :season, :presence => true
  
  before_save :check_age_level #if age level changed?

  def check_age_level
    # if age_level_ids.include?(7)
    #   (1...7).each do |i|
    #     age_level_ids << i
    #     self.save #-- infinite loop
    #   end
    # end
    # all = true
    # (1...7).each do |i|
    #   if not age_level_ids.include?(i)
    #     all = false
    #   end
    # end
    # if all
    #   age_level_ids << 7
    #   self.save #-- infinite loop
    # end
  end


  def self.find_all_by_name(name)
    where("name like ?", name)
  end

  def self.find_by_search_results_with_too_many_forks(name, skill_id, age_level_ids, badge_ids, season_number)
    seasons = Event.seasons_for_search(season_number.to_i)
    skills = Event.skills_for_search(skill_id)
    badges = Event.badges_for_search(badge_ids)

    if (name != "") && seasons.nil? && skills.nil? && age_level_ids.nil? && badge_ids.nil?
      results = Event.find_all_by_name(name.capitalize)
    elsif age_level_ids && (badge_ids != []) && (name != "")
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badges).where("name like ?", name).where(season: seasons, skill: skills).uniq
    elsif age_level_ids && (badge_ids != [])
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badges).where(season: seasons, skill: skills).uniq 
    elsif age_level_ids && (name != "")
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where("name like ?", name).where(season: seasons, skill: skills).uniq
    elsif age_level_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where(season: seasons, skill: skills).uniq 
    elsif (badge_ids != []) && (name != "")
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badges).where("name like ?", name).where(season: seasons, skill: skills).uniq
    elsif (badge_ids != [])
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badges).where(season: seasons, skill: skills).uniq 
    elsif (name != "")
      results = Event.where("name like ?", name).where(season: seasons, skill: skills).uniq
    else
      results = Event.where(season: seasons, skill: skills).uniq
    end
    results
  end

  def self.seasons_for_search(searched_season_number)
    seasons = {1 => 'Any', 2 => 'Spring', 3 => 'Summer', 5 => 'Fall', 7 => 'Winter', 49 => 'January', 77 => 'Febuary', 14 => 'March', 4 => 'April', 22 => 'May', 6 => 'June', 9 => 'July', 33 => 'August', 15 => 'September', 25 => 'October', 55 => 'November', 35 => 'December', 245 => 'New Years', 117 => 'Independence Day'}
    season_array = []
    seasons.each do |season_number, season_name|
      if searched_season_number % season_number == 0 || season_number % searched_season_number == 0
        season_array << season_name
      end
    end
    season_array
  end

  def self.badges_for_search(names)
    ids = []
    names.each do |name|
      b = Badge.find_by(name: name)
      ids<< b.id
    end
    ids
  end

  def self.skills_for_search(skill_id)
    if skill_id.to_i > 0
      skills = Skill.where(id: skill_id)
    elsif skill_id == "GENERAL"
      skills = Skill.where(category: 'GENERAL')
    elsif skill_id == "STEM"
      skills = Skill.where(category: 'STEM')
    elsif skill_id == "BUSINESS SMARTS"
      skills = Skill.where(category: 'BUSINESS SMARTS')
    elsif skill_id == "NATURE & ECOLOGY"
      skills = Skill.where(category: 'NATURE & ECOLOGY')
    else
      skills = Skill.all
    end
    skills
  end

  def self.find_by_skill_category(category_name)
    category_name = category_name.gsub("-and-"," & ").gsub("-"," ")
    Event.joins(:skill).where("skills.category like ?", category_name.upcase)
  end

end
