class AddBadgeIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :badge_id, :integer
  end
end
