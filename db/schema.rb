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

ActiveRecord::Schema.define(version: 20150301213455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_promoters", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_promoters", ["business_id"], name: "index_business_promoters_on_business_id", using: :btree
  add_index "business_promoters", ["promoter_id"], name: "index_business_promoters_on_promoter_id", using: :btree

  create_table "businesses", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "description"
  end

  add_index "businesses", ["email"], name: "index_businesses_on_email", unique: true, using: :btree
  add_index "businesses", ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true, using: :btree

  create_table "deal_types", force: :cascade do |t|
    t.string   "name"
    t.float    "commission"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "business_id"
  end

  add_index "deal_types", ["business_id"], name: "index_deal_types_on_business_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "picture"
    t.string   "phone"
  end

  add_index "promoters", ["email"], name: "index_promoters_on_email", unique: true, using: :btree
  add_index "promoters", ["reset_password_token"], name: "index_promoters_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "business_promoters", "businesses"
  add_foreign_key "business_promoters", "promoters"
  add_foreign_key "deal_types", "businesses"
  add_foreign_key "deals", "businesses"
  add_foreign_key "deals", "deal_types"
  add_foreign_key "deals", "promoters"
end
