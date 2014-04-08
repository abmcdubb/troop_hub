class Badge < ActiveRecord::Base
    has_many :event_badges
    has_many :events, through: :event_badges
end
