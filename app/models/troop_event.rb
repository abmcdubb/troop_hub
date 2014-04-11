class TroopEvent < ActiveRecord::Base
  belongs_to :troop
  belongs_to :event
  has_many :photos, as: :photoable

    def on_page_photos#this should be a method on photoable. not dry
        photos.where("on_page = \"true\" ")
    end
end
