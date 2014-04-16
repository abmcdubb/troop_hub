require 'csv'

class UnofficialBadgesParser

    CSV.foreach('./Patches1.csv') do |row|
      new_row = row.join(",")     
      name, logo, troop_type  = new_row.split(",")
      badge = Badge.create(:name => name.strip, :logo => logo.strip, :troop_type => troop_type.strip)

  end
end

  # def all_buildings_csv
  #   CSV.foreach(@url) do |row|
  #     new_row = row.join(",")      
  #     borough, block, lot, cd  = new_row.split(",")
  #     building = Building.create(:borough => borough.strip, :tax_block => block.strip, :tax_lot => lot.strip, :community_district => cd.strip)
  #   end
  # end