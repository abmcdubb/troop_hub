class Troop < ActiveRecord::Base
   has_many :troop_events
   has_many :events, through: :troop_events
end
