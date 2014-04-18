require 'csv'

class Parser

  def initialize(file_path)
    @file_path = file_path
  end

  def official_badge_list
    badge_list = Nokogiri::HTML(@file_path)

    badge_list.css("li").each do |b|
      if b.attr('thetitle') != nil
        badge = Badge.new
        badge.logo = b.css('img').attr('src').text
        
        if b.attr("thetitle") == "Women&#8217;s Health"
          badge.name = "Women's Health"
        elsif b.attr("thetitle").include?('&amp;')
          badge.name =  b.attr("thetitle").gsub('&amp;', '&')
        else badge.name = b.attr("thetitle")
        end

        badge.troop_type = b.attr("agelevel")
        badge.category = "#{b.attr('subcategory')} - #{b.attr('category')}"
        badge.save
      end
    end
  end

  def unofficial_badge_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      name, logo, troop_type  = new_row.split(",")
      badge = Badge.create(:name => name.strip, :logo => logo.strip, :troop_type => troop_type.strip)
    end
  end

#badgeparser1 = Parser.new('./gs_site.html')
#badgeparser2 = Parser.new('./Patches1.csv')
#badgeparser3 = Parser.new('./Patches2.csv')

  def activities_list_for_events
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      name, skill_id, badge_id  = new_row.split(",")
      event = Event.create(:name => name.strip, :skill_id => skill_id.strip.to_i, :badge_id => badge_id.strip.to_i)
    end
  end

end

  def unofficial_badge_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      name, logo, troop_type  = new_row.split(",")
      badge = Badge.create(:name => name.strip, :logo => logo.strip, :troop_type => troop_type.strip)
    end
  end

  def troop_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")    
      troop_type, number, city, state  = new_row.split(",")
      troop = Troop.create(:troop_type => troop_type.strip, :number => number.strip, :city => city.strip, :state => state.strip)
    end
  end

# Girl Scout Troop,31212,Birmingham, Alabama
#badgeparser1 = Parser.new('./gs_site.html')
#badgeparser2 = Parser.new('./Patches1.csv')
#troopdb = Parser.new('./troopdb.csv')



