class Scout < ActiveRecord::Base
	belongs_to :troop
	mount_uploader :profile_photo, ProfilePhotoUploader
		# validates_presence_of   :profile_photo
  # 		validates_integrity_of  :profile_photo
  # 		validates_processing_of :profile_photo
end
