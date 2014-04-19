class Event < ActiveRecord::Base
  has_many :troop_events
  has_many :troops, through: :troop_events

  has_many :event_badges, dependent: :destroy
  has_many :badges, through: :event_badges, dependent: :destroy

  has_many :event_age_levels, dependent: :destroy
  has_many :age_levels, through: :event_age_levels, dependent: :destroy
  belongs_to :skill

  validates :name, :presence => true
  validates :age_level_ids, :presence => true  
  validates :skill_id, :presence => true
  validates :season, :presence => true
  

  def self.find_all_by_name(name)
    where("name='#{name}'")
  end

  def self.find_by_search_results(results_hash, age_level_ids, badge_ids, season_number)
    seasons = Event.seasons_for_search(season_number.to_i)
    results_hash["season"] = seasons
    query_hash = results_hash.reject{|k,v|v.empty?}
    if age_level_ids && badge_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where(query_hash).uniq
    elsif age_level_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where(query_hash).uniq
    elsif badge_ids
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where(query_hash).uniq
    else
      results = where(query_hash)
    end
    results
  end

  def self.find_by_search_results_with_too_many_forks(results_hash, age_level_ids, badge_ids, season_number)
    seasons = Event.seasons_for_search(season_number.to_i)
    results_hash["season"] = seasons
    query_hash = results_hash.reject{|k,v|v.empty?}

    if age_level_ids && badge_ids && query_hash["name"] && query_hash["genre"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("name like ? and genre like ?", query_hash["name"], query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids && badge_ids && query_hash["name"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("name like ?", query_hash["name"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids && badge_ids && query_hash["genre"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("genre like ?", query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids && badge_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where(season: query_hash["season"]).uniq 
    elsif age_level_ids && query_hash["name"] && query_hash["genre"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where("name like ? and genre like ?", query_hash["name"], query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids && query_hash["name"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where("name like ?", query_hash["name"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids && query_hash["genre"]
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where("genre like ?", query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif age_level_ids
      results = Event.all.joins(:event_age_levels).where(:"event_age_levels.age_level_id" => age_level_ids).where(season: query_hash["season"]).uniq 
    elsif badge_ids && query_hash["name"] && query_hash["genre"]
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("name like ? and genre like ?", query_hash["name"], query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif badge_ids && query_hash["name"]
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("name like ?", query_hash["name"]).where(season: query_hash["season"]).uniq
    elsif badge_ids && query_hash["genre"]
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where("genre like ?", query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif badge_ids
      results = Event.all.joins(:event_badges).where(:"event_badges.badge_id" => badge_ids).where(season: query_hash["season"]).uniq 
    elsif query_hash["name"] && query_hash["genre"]
      results = Event.where("name like ? and genre like ?", query_hash["name"], query_hash["genre"]).where(season: query_hash["season"]).uniq
    elsif query_hash["name"]
      results = Event.where("name like ?", query_hash["name"]).where(season: query_hash["season"]).uniq
    elsif query_hash["genre"]
      results = Event.where("genre like ?", query_hash["genre"]).where(season: query_hash["season"]).uniq
    else
      results = Event.where(season: query_hash["season"]).uniq
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

  def self.find_by_skill_category(category_name)
    category_name = category_name.gsub("-and-"," & ").gsub("-"," ")
    Event.joins(:skill).where("skills.category like ?", category_name)
  end

end
