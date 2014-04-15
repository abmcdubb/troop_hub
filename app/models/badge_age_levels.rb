class BadgeAgeLevels < ActiveRecord::Base
  belongs_to :badge
  belongs_to :age_level
end
