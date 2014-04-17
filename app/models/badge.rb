class Badge < ActiveRecord::Base
    has_many :event_badges
    has_many :events, through: :event_badges
    has_many :user_badges
    has_many :users, through: :user_badges
    has_many :badge_age_levels
    has_many :age_levels, through: :badge_age_levels
end

#update!
