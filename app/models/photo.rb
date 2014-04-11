class Photo < ActiveRecord::Base
    belongs_to :photoable, polymorphic: true
    mount_uploader :pic, PhotoUploader

    def self.create_from_params(photo_params)
        @photo=Photo.create(photo_params)
        @photo.photoable_type = @photo.photoable_type.camelize
        @photo.save
    end
end
