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

ActiveRecord::Schema.define(version: 20170515002545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.bigint "lift_id"
    t.integer "sets", null: false
    t.integer "reps", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight", precision: 100, scale: 6, null: false
    t.string "units", null: false
    t.index ["lift_id"], name: "index_entries_on_lift_id"
  end

  create_table "lifts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((name)::text)", name: "lifts_lower_name_idx", unique: true
    t.index ["user_id"], name: "index_lifts_on_user_id"
  end

  create_table "nicknames", force: :cascade do |t|
    t.bigint "lift_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((name)::text)", name: "nicknames_lower_name_idx", unique: true
    t.index ["lift_id"], name: "index_nicknames_on_lift_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "users_lower_email_idx", unique: true
  end

  add_foreign_key "entries", "lifts"
  add_foreign_key "lifts", "users"
  add_foreign_key "nicknames", "lifts"
end
