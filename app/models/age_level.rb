class AgeLevel < ActiveRecord::Base
    has_many :event_age_levels
    has_many :events, through: :event_age_levels
    has_many :troops
end
