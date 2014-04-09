class Adult < ActiveRecord::Base
  belongs_to :troop
  has_many :adult_skills
  has_many :skills, through: :adult_skills
end
