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

ActiveRecord::Schema.define(version: 20160226175706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.integer  "floor_count"
    t.integer  "elevator_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "buildings", ["name"], name: "index_buildings_on_name", using: :btree

  create_table "elevators", force: :cascade do |t|
    t.string   "name"
    t.integer  "moving",      default: 0
    t.integer  "direction"
    t.integer  "enabled",     default: 1
    t.integer  "floor_idx"
    t.integer  "building_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "elevators", ["building_id"], name: "index_elevators_on_building_id", using: :btree
  add_index "elevators", ["direction"], name: "index_elevators_on_direction", using: :btree
  add_index "elevators", ["enabled"], name: "index_elevators_on_enabled", using: :btree
  add_index "elevators", ["floor_idx"], name: "index_elevators_on_floor_idx", using: :btree
  add_index "elevators", ["moving"], name: "index_elevators_on_moving", using: :btree

  create_table "floors", force: :cascade do |t|
    t.integer  "idx",                     null: false
    t.string   "name"
    t.integer  "building_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "waiting",     default: 0
  end

  add_index "floors", ["building_id"], name: "index_floors_on_building_id", using: :btree
  add_index "floors", ["idx"], name: "index_floors_on_idx", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "direction",  null: false
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requests", ["floor_id"], name: "index_requests_on_floor_id", using: :btree

  add_foreign_key "elevators", "buildings"
  add_foreign_key "floors", "buildings"
  add_foreign_key "requests", "floors"
end
