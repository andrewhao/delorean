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

ActiveRecord::Schema.define(version: 20151018213901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inflation_adjustments", force: :cascade do |t|
    t.float    "percent_change"
    t.datetime "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "start_date",    null: false
    t.datetime "end_date"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "order_menu_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "order_menu_items", ["menu_item_id"], name: "index_order_menu_items_on_menu_item_id", using: :btree
  add_index "order_menu_items", ["order_id"], name: "index_order_menu_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "amount"
    t.integer  "stripe_charge_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "invoice_id",       null: false
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_tiers", force: :cascade do |t|
    t.float    "rate"
    t.boolean  "is_eligible_for_trip_pooling", default: false
    t.integer  "vehicle_type_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "trip_pool_trips", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "trip_pool_id", null: false
    t.integer  "trip_id",      null: false
  end

  create_table "trip_pools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "origin_date"
    t.datetime "destination_date"
    t.boolean  "is_in_progress",   default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "driver_id"
    t.integer  "passenger_id"
    t.integer  "service_tier_id",                  null: false
    t.integer  "order_id"
  end

  add_index "trips", ["order_id"], name: "index_trips_on_order_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "is_driver",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "service_tier_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["service_tier_id"], name: "index_users_on_service_tier_id", using: :btree

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vehicle_types", ["name"], name: "index_vehicle_types_on_name", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.float    "gigawatt_output_rating"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "vehicle_type_id"
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "order_menu_items", "menu_items"
  add_foreign_key "order_menu_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "trips", "orders"
  add_foreign_key "users", "service_tiers"
  add_foreign_key "vehicles", "users"
end
