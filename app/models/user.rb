class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :troop_users
  has_many :troops, through: :troop_users

  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :badges, through: :scout_badges
end
