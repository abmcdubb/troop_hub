class EventBadge < ActiveRecord::Base
    belongs_to :event
    belongs_to :badge
end
