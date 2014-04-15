class Parser

html = File.read('http://forgirls.girlscouts.org/home/badgeexplorer/')

badge_list = Nokogiri::HTML(html)

badges = {}

#replace css selectors:



badge_list.css("div#badge-holder-container").each do |project|
	title = badge.css("h2.bbcard_name strong a").text.to_sym
	puts badges[title] = {
		:logo => badges.css('li').attr('img').attr('src').text,
		:name => badge.css("p.bbcard_blurb").text,
		:troop_type => badge.css("ul.badge-meta span.location-name").text,
		:category => badge.css("ul.badge-stats li.first.funded strong").text.gsub("%","").to_i
		:description => badge.css("ewkrughewkrghekwhg").text.ergkuhewkgh
	}
end

# badges.css('li').attr('agelevel')
# badges.css('li').attr('img').attr('src').text
# badges.css('li').attr('agelevel')
