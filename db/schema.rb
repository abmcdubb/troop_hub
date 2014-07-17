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

ActiveRecord::Schema.define(version: 20140421142606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_levels", force: true do |t|
    t.string   "name"
    t.string   "grades"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agendas", force: true do |t|
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
    t.string   "badges"
    t.string   "snack"
    t.text     "jobs"
    t.text     "supplies"
    t.text     "troop_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  #this should just be an age_level_id in the badge table
  create_table "badge_age_levels", force: true do |t|
    t.integer  "badge_id"
    t.integer  "age_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "badge_age_levels", ["age_level_id"], name: "index_badge_age_levels_on_age_level_id", using: :btree
  add_index "badge_age_levels", ["badge_id"], name: "index_badge_age_levels_on_badge_id", using: :btree

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
    t.integer  "skill_id"
    t.integer  "badge_id"
  end

  create_table "newsletters", force: true do |t|
    t.string   "item1_title"
    t.text     "item1_desc"
    t.string   "item2_title"
    t.text     "item2_desc"
    t.string   "item3_title"
    t.text     "item3_desc"
    t.text     "note_from_leader"
    t.string   "leader"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "troop_id"
    t.string   "news_photo"
  end

  create_table "photos", force: true do |t|
    t.string   "pic"
    t.string   "hovertext"
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "on_page"
  end

  create_table "scouts_badges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.boolean  "badge_related_skill", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "troop_blogs", force: true do |t|
    t.integer  "troop_id"
    t.string   "headline"
    t.text     "body"
    t.string   "photo"
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

  create_table "troop_users", force: true do |t|
    t.integer  "troop_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "troops", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "meetup_location"
    t.text     "about_us"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age_level_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "troop_type"
    t.string   "photo"
  end

  create_table "user_badges", force: true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_badges", ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
  add_index "user_badges", ["user_id"], name: "index_user_badges_on_user_id", using: :btree

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.string   "skill_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "admin_privileges"
    t.string   "role"
    t.string   "name"
    t.string   "phone_number"
    t.string   "grade"
    t.date     "birthday"
    t.integer  "dues"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_photo"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
