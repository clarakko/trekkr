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

ActiveRecord::Schema.define(version: 20160128161215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "challenges", force: :cascade do |t|
    t.string "title",       null: false
    t.string "tagline",     null: false
    t.string "description", null: false
  end

  add_index "challenges", ["title"], name: "index_challenges_on_title", unique: true, using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "challenge_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["challenge_id"], name: "index_entries_on_challenge_id", using: :btree
  add_index "entries", ["user_id", "challenge_id"], name: "index_entries_on_user_id_and_challenge_id", unique: true, using: :btree
  add_index "entries", ["user_id"], name: "index_entries_on_user_id", using: :btree

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "trek_id",                    null: false
    t.datetime "starts_at",                  null: false
    t.datetime "ends_at"
    t.string   "duration"
    t.integer  "duration_s"
    t.decimal  "distance"
    t.string   "weather"
    t.string   "conditions"
    t.integer  "difficulty"
    t.boolean  "public",     default: false
    t.text     "report",                     null: false
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "challenge_id", null: false
    t.integer  "trek_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["challenge_id", "trek_id"], name: "index_steps_on_challenge_id_and_trek_id", unique: true, using: :btree
  add_index "steps", ["challenge_id"], name: "index_steps_on_challenge_id", using: :btree
  add_index "steps", ["trek_id"], name: "index_steps_on_trek_id", using: :btree

  create_table "treks", force: :cascade do |t|
    t.string "title",       null: false
    t.string "location",    null: false
    t.string "description", null: false
    t.string "lat"
    t.string "lon"
  end

  add_index "treks", ["location"], name: "index_treks_on_location", using: :btree
  add_index "treks", ["title"], name: "index_treks_on_title", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
