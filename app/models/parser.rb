class Parser

  html = File.read('./gs_site.html')

  badge_list = Nokogiri::HTML(html)

  badge_list.css("li").each do |b|
    if b.attr('thetitle') != nil
      badge = Badge.new
  		badge.logo = b.css('img').attr('src').text
  		badge.name = b.attr("thetitle")
  		badge.troop_type = b.attr("agelevel")
  		badge.category = b.attr("subcategory")
      badge.save
    end
  end

end
