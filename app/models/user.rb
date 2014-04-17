class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_and_belongs_to_many :troops

  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :badges, through: :scout_badges
  has_many :troop_news

end
