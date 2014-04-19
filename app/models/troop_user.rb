class TroopUser < ActiveRecord::Base
  belongs_to :troop
  belongs_to :user

end
