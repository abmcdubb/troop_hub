class Event < ActiveRecord::Base
   has_many :troop_events
   has_many :troops, through: :troop_events

   has_many :event_badges
   has_many :badges, through: :event_badges

   has_many :event_age_levels
   has_many :age_levels, through: :event_age_levels

    def self.find_by_search_results(results_hash, age_level_ids, badge_ids)
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

    def self.find_all_by_name(name)
        where("name='#{name}'")
    end


end
