class Photo < ActiveRecord::Base
    belongs_to :photoable, polymorphic: true
    mount_uploader :pic, PhotoUploader

    def self.create_from_params(photo_params)
        @photo=Photo.create(photo_params)
        @photo.photoable_type = @photo.photoable_type.camelize
        @photo.save
    end

    def on_page=(string)
        if string == "true"
            Photo.all.where(photoable_type: self.photoable_type).where(photoable_id: self.photoable_id).each do |photo|
                photo.on_page = "false"
                photo.save
            end
            super
        else
            super
        end
    end #doesn't account for if shovel
end