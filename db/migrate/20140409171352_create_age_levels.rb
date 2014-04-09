class CreateAgeLevels < ActiveRecord::Migration
  def change
    create_table :age_levels do |t|
      t.string :name
      t.string :grades
      t.string :logo

      t.timestamps
    end
  end
end
