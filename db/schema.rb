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

ActiveRecord::Schema.define(version: 20160502121011) do

  create_table "extensions", force: :cascade do |t|
    t.string   "name"
    t.datetime "release"
    t.boolean  "standard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hs_cards", force: :cascade do |t|
    t.string  "name"
    t.integer "cost"
    t.integer "attack_points"
    t.integer "life_points"
    t.text    "description"
    t.integer "rarity_id"
    t.integer "hs_class_id"
    t.integer "extension_id"
  end

  add_index "hs_cards", ["extension_id"], name: "index_hs_cards_on_extension_id"
  add_index "hs_cards", ["hs_class_id"], name: "index_hs_cards_on_hs_class_id"
  add_index "hs_cards", ["rarity_id"], name: "index_hs_cards_on_rarity_id"

  create_table "hs_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "hero_power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
