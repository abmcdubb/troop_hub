# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140410143745) do

  create_table "adult_skills", force: true do |t|
    t.integer  "adult_id"
    t.integer  "skill_id"
    t.string   "skill_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adults", force: true do |t|
    t.integer  "troop_id"
    t.string   "adult_role"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "profile_photo"
    t.string   "admin_privileges"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "age_levels", force: true do |t|
    t.string   "name"
    t.string   "grades"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agendas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "meeting_date"
    t.string   "location"
    t.text     "activity_1"
    t.text     "activity_2"
    t.text     "activity_3"
    t.text     "activity_4"
    t.text     "activity_5"
    t.text     "activity_6"
    t.text     "activity_7"
    t.text     "activity_8"
    t.string   "patches"
    t.string   "snack"
    t.text     "jobs"
    t.text     "supplies"
    t.text     "correspondence"
    t.text     "troop_info"
    t.text     "parent_info"
    t.text     "decisions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "troop_type"
    t.string   "category"
    t.string   "logo"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_age_levels", force: true do |t|
    t.integer  "event_id"
    t.integer  "age_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_badges", force: true do |t|
    t.integer  "event_id"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "genre"
    t.text     "description"
    t.string   "season"
    t.string   "one_time"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scouts", force: true do |t|
    t.string   "name"
    t.integer  "troop_id"
    t.string   "grade"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone_number"
    t.string   "admin_privileges"
    t.integer  "dues"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_photo"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.boolean  "badge_related_skill", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "troop_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "troop_id"
    t.datetime "start_time"
    t.string   "location"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "troops", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "troop_type"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "meetup_location"
    t.text     "about_us"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
