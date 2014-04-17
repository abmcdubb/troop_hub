class Parser

  html = File.read('./gs_site.html')

  badge_list = Nokogiri::HTML(html)

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
