class Adult < ActiveRecord::Base
  belongs_to :troop
  has_many :skills
end
