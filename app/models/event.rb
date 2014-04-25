require 'prime'

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


  def self.find_all_by_name(name)
    where("name like ?", name)
  end

  def self.find_by_search_results_with_too_many_forks(name, skill_id, age_level_ids, badge_ids, season_number)
    seasons = Event.seasons_for_search(season_number.to_i)
    skills = Event.skills_for_search(skill_id)
    badges = Event.badges_for_search(badge_ids)
    ages = Event.ages_for_search(age_level_ids) if age_level_ids

    if (name != "") && seasons.nil? && skills.nil? && age_level_ids.nil? && badge_ids.nil?
      results = Event.find_all_by_name(name.capitalize)
    elsif age_level_ids && (badge_ids != []) && (name != "")
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => ages).joins(:event_badges).where(:"event_badges.badge_id" => badges).where("name like ?", name).where(season: seasons, skill: skills).uniq
    elsif age_level_ids && (badge_ids != [])
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => ages).joins(:event_badges).where(:"event_badges.badge_id" => badges).where(season: seasons, skill: skills).uniq 
    elsif age_level_ids && (name != "")
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => ages).where("name like ?", name).where(season: seasons, skill: skills).uniq
    elsif age_level_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => ages).where(season: seasons, skill: skills).uniq 
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

  def self.ages_for_search(ages)
    if ages.include?(7.to_s)
      (1...7).each do |x|
        ages << x
      end
    else
      all = true
      (1...7).each do |i|
        if not ages.include?(i.to_s)
          all = false
        end
      end
      if all
        ages << 7
      end
    end
    ages
  end


  def self.skills_for_search(skill_id)
    if skill_id.to_i > 0
      skills = Skill.where(id: skill_id)
    elsif skill_id == "General"
      skills = Skill.where(category: 'GENERAL')
    elsif skill_id == "STEM"
      skills = Skill.where(category: 'STEM')
    elsif skill_id == 'Business Smarts'
      skills = Skill.where(category: 'BUSINESS SMARTS')
    elsif skill_id == "Nature and Ecology"
      skills = Skill.where(category: 'NATURE AND ECOLOGY')
    else
      skills = Skill.all
    end
    skills
  end

  def self.find_by_skill_category(category_name)
    category_name = category_name.gsub("-and-"," & ").gsub("-"," ")
    Event.joins(:skill).where("skills.category like ?", category_name.upcase)
  end


  def self.header_for_advanced_search_results(search_criteria)
    header = "Events"
    if (search_criteria[:name] != "")
      header += " named #{search_criteria[:name]}"
    end
    if (search_criteria[:skill_id].to_i != 0)
      skill = Skill.find(search_criteria[:skill_id]).name
      header += " related to #{skill}"
    elsif (search_criteria[:skill_id] != "Any")
      header += " related to #{search_criteria[:skill_id]}"
    else
      header += " related to Any Category"
    end
    if (search_criteria[:age_level_ids])
      ages = " for"
      search_criteria[:age_level_ids].each_with_index do |age_level_id, i|
        if (i == 0)
          name = AgeLevel.find(age_level_id).name
          ages+= " #{name.pluralize}"
        else
          name = AgeLevel.find(age_level_id).name
          ages+= " or #{name.pluralize}"
        end
      end
      header += "#{ages}"
    end
      header += Event.seasons_for_header(search_criteria[:season])
    if (search_criteria[:badge_ids] != "")
      badges = Event.badges_for_search_result_header(search_criteria[:badge_ids])
      header += " giving #{badges}"
    end
    header
  end

  def self.badges_for_search_result_header(badge_names)#this method and one above should be in controller
    badge_names_array = badge_names.split(",") #this and next three lines of code is taken from create event controller. This should either be abstraced or ask emma if autocomplete will allow us to save data from this field in array
    badge_string = ""
    badge_names_array.each_with_index do |b, i|
      if (i == (badge_names_array.length - 1) && badge_names_array.length != 1 && badge_names_array.length != 2)
        badge_string += "or #{b} badges"
      elsif (badge_names_array.length != 1 && badge_names_array.length != 2)
        badge_string += "#{b}, "
      elsif  badge_names_array.length != 2
        badge_string += "a #{b} badge"
      elsif i != (badge_names_array.length - 1)
        badge_string+=b
      else
        badge_string += " or #{b} badges"
      end
    end
    " badges"
    badge_string
  end

  def self.seasons_for_header(number)
    seasons = ""

    lookup_hash = {1 => 'Any', 2 => 'Spring', 3 => 'Summer', 5 => 'Fall', 7 => 'Winter', 49 => 'January', 77 => 'Febuary', 14 => 'March', 4 => 'April', 22 => 'May', 6 => 'June', 9 => 'July', 33 => 'August', 15 => 'September', 25 => 'October', 55 => 'November', 35 => 'December', 245 => 'New Years', 117 => 'Independence Day'}
    number = number.to_i
    factors = Prime.prime_division(number)
    sum = 0
    factors.each do |array|
        sum+=array[1]
      end
    
    if sum == 0
      seasons+= " during any season"
    elsif sum == 1
      seasons+= " during the #{lookup_hash[number]}"
    elsif sum == 2
      seasons += " in the month of #{lookup_hash[number]}"
    else
      seasons += " on #{lookup_hash[number]}"
    end
    seasons
  end

end
