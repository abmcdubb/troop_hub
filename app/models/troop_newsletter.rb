class TroopNewsletter < ActiveRecord::Base
  belongs_to :troop
  belongs_to :newsletter
end
