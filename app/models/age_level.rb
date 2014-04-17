class AgeLevel < ActiveRecord::Base
    has_many :event_age_levels
    has_many :events, through: :event_age_levels
    has_many :troops
    has_many :badge_age_levels
    has_many :badges, through: :badge_age_levels
end
