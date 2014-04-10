class Skill < ActiveRecord::Base
   has_many :adult_skills
   has_many :adults, through: :adult_skills
end
