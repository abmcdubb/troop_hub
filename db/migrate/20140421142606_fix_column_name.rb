class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :agendas, :patches, :badges
  end
end
