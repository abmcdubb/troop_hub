class TroopBlog < ActiveRecord::Base
  belongs_to :troop

  def self.homepage_news_feed
    order(created_at: :desc).limit(3)
  end

  def formatted_date
    "#{created_at.month}/#{created_at.day}/#{created_at.year}"
  end

  def find_troop_name(troop_id)
    Troop.find(troop_id).name
  end
end
