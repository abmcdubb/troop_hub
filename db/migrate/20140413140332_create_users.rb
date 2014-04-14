class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer  "troop_id"
      t.string   "admin_privileges"
      t.string   "role"
      t.string   "name"
      t.string   "phone_number"
      t.string   "grade"
      t.date     "birthday"
      t.integer  "dues"

      t.timestamps
    end
  end
end