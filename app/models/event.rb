class Event < ActiveRecord::Base
   has_many :troop_events
   has_many :troops, through: :troop_events

   has_many :event_badges
   has_many :badges, through: :event_badges
end
