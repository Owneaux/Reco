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

ActiveRecord::Schema.define(version: 20150227095017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deal_types", force: :cascade do |t|
    t.string   "name"
    t.float    "commision"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "deal_type_id"
    t.integer  "promoter_id"
    t.integer  "business_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "deals", ["business_id"], name: "index_deals_on_business_id", using: :btree
  add_index "deals", ["deal_type_id"], name: "index_deals_on_deal_type_id", using: :btree
  add_index "deals", ["promoter_id"], name: "index_deals_on_promoter_id", using: :btree

  create_table "promoters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "picture"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deals", "businesses"
  add_foreign_key "deals", "deal_types"
  add_foreign_key "deals", "promoters"
end
