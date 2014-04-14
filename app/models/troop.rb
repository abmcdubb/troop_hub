class Troop < ActiveRecord::Base
   has_many :troop_events
   has_many :users
   has_many :events, through: :troop_events

   has_many :photos, as: :photoable

    def on_page_photos#this should be a method on photoable. not dry
        photos.where("on_page = \"true\" ")
    end

    def profile_url
        if on_page_photos != []
            url = on_page_photos.last.pic_url
        else
            url = "daisy_logo.jpg"
        end
        url
    end
end
