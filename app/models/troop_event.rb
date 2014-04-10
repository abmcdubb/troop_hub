class TroopEvent < ActiveRecord::Base
  belongs_to :troop
  belongs_to :event
  has_many :photos, as: :photoable
end
