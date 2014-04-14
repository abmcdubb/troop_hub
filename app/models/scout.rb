class Scout < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
  belongs_to :troop
  has_many :badges, through: :scout_badges

	mount_uploader :profile_photo, ProfilePhotoUploader
		# validates_presence_of   :profile_photo
  # 		validates_integrity_of  :profile_photo
  # 		validates_processing_of :profile_photo
end
#update!
