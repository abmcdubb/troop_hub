class TroopBlog < ActiveRecord::Base
  belongs_to :troop

  mount_uploader :photo, ProfilePhotoUploader

  def self.homepage_news_feed
    order(created_at: :desc).limit(3)
  end

  def formatted_date
    "#{created_at.month}/#{created_at.day}/#{created_at.year}"
  end

  def find_troop_name(troop_id)
    Troop.find(troop_id).name
  end

  def self.troop_news_feed(troop_id)
    TroopBlog.where(troop_id: troop_id).order(created_at: :desc).limit(5)
  end

  def self.sidebar_news_feed(troop_id)
    TroopBlog.where(troop_id: troop_id).order(created_at: :desc).limit(4)
  end

  def self.full_news_feed(troop_id)
    TroopBlog.where(troop_id: troop_id).order(created_at: :desc)
  end

  def self.large_sidebar_news_feed(troop_id)
    TroopBlog.where(troop_id: troop_id).order(created_at: :desc).limit(10)
  end

end
