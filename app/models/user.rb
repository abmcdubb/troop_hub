class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, PhotoUploader
         
  belongs_to :troop
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :badges, through: :scout_badges
end
