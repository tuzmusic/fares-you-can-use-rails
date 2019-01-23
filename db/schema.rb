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

ActiveRecord::Schema.define(version: 2019_01_23_171044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "iata"
    t.string "icao"
    t.float "latitude"
    t.float "longitude"
    t.float "altitude"
    t.integer "timezone"
    t.string "dst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state_name"
    t.integer "state_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string "headline"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instructions"
    t.date "posted_date"
    t.string "blog_head"
    t.string "blog_foot"
  end

  create_table "destination_airports", force: :cascade do |t|
    t.integer "airport_id"
    t.integer "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origin_airports", force: :cascade do |t|
    t.bigint "airport_id"
    t.bigint "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_origin_airports_on_airport_id"
    t.index ["deal_id"], name: "index_origin_airports_on_deal_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "origin_airports", "airports"
  add_foreign_key "origin_airports", "deals", on_delete: :cascade
end
