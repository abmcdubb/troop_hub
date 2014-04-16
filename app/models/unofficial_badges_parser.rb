require 'csv'

class UnofficialBadgesParser

    CSV.foreach('./Patches1.csv') do |row|
      new_row = row.join(",")     
      name, logo, troop_type  = new_row.split(",")
      badge = Badge.create(:name => name.strip, :logo => logo.strip, :troop_type => troop_type.strip)

  end
end

