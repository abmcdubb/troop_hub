class TroopEvent < ActiveRecord::Base
  belongs_to :troop
  belongs_to :event
end
