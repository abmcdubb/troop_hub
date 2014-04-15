class Newsletter < ActiveRecord::Base
  has_many :troop_newsletters
  has_many :troops, through: :troop_newsletters
end
