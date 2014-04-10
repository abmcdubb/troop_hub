class AdultSkill < ActiveRecord::Base
  belongs_to :adult
  belongs_to :skill
end