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

ActiveRecord::Schema.define(version: 20151015054409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.integer  "order_id"
    t.integer  "amount"
    t.integer  "stripe_charge_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree
  add_index "payments", ["trip_id"], name: "index_payments_on_trip_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "trip_pool_trips", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_pools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_service_tiers", force: :cascade do |t|
    t.float    "billed_rate"
    t.boolean  "is_eligible_for_trip_pooling"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "origin_date"
    t.datetime "destination_date"
    t.boolean  "is_in_progress"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password"
    t.string   "email"
    t.boolean  "is_driver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.float    "gigawatt_output_rating"
    t.integer  "user_id"
    t.integer  "trip_service_tier_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vehicles", ["trip_service_tier_id"], name: "index_vehicles_on_trip_service_tier_id", using: :btree
  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "trips"
  add_foreign_key "payments", "users"
  add_foreign_key "vehicles", "trip_service_tiers"
  add_foreign_key "vehicles", "users"
end