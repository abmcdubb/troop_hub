class Badge < ActiveRecord::Base
    has_many :event_badges
    has_many :events, through: :event_badges
    has_many :scout_badges
    has_many :scouts, through: :scout_badges
end

#update!
