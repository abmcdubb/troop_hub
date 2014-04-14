class Adult < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :email, :uniqueness => { :case_sensitive => false }

  belongs_to :troop
  has_many :adult_skills
  has_many :skills, through: :adult_skills

end

#update!
