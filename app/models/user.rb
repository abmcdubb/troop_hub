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
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :troop_news

  def admin?
    admin_privileges == "admin" ? true : false
  end

  def scout?
    admin_privileges == "troop member" ? true : false
  end

  def troop_member?
    current_user.troop_id == TroopUser.troop_id
  end
end
