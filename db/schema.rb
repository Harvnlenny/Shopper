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

ActiveRecord::Schema.define(version: 20150713195942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "price_publix",     default: 0, null: false
    t.integer  "price_winn_dixie", default: 0, null: false
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "picture"
  end

  create_table "list_items", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.integer  "quantity",   default: 0, null: false
    t.integer  "subtotal",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "savings"
  end

  add_index "list_items", ["item_id"], name: "index_list_items_on_item_id", using: :btree
  add_index "list_items", ["list_id"], name: "index_list_items_on_list_id", using: :btree
  add_index "list_items", ["user_id"], name: "index_list_items_on_user_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "list_items", "items"
  add_foreign_key "list_items", "lists"
  add_foreign_key "list_items", "users"
end
