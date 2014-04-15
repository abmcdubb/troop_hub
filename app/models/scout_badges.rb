class ScoutBadges < ActiveRecord::Base
    belongs_to :scout
    belongs_to :badge
end
