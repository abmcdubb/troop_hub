class TroopEvent < ActiveRecord::Base
  belongs_to :troop
  belongs_to :event
  has_many :photos, as: :photoable
  validates :start_time, :presence => true

    def name
        if event && (event.name != "")
            event_name = event.name
        else
            event_name = "Do Fun Stuff"
        end
        event_name
    end
end
