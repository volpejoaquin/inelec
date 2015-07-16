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

ActiveRecord::Schema.define(version: 20150716233841) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.integer  "category_id"
    t.integer  "postal_code"
    t.string   "phone"
    t.string   "email"
    t.string   "cuit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.string   "charge"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagnostics", force: true do |t|
    t.datetime "date"
    t.text     "comments"
    t.integer  "transformer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entry_orders", force: true do |t|
    t.datetime "date"
    t.integer  "number"
    t.integer  "client_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exit_orders", force: true do |t|
    t.datetime "date"
    t.integer  "number"
    t.integer  "client_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transformers", force: true do |t|
    t.string   "mark"
    t.string   "power"
    t.string   "number"
    t.integer  "record_id"
    t.integer  "diagnostic"
    t.text     "comments"
    t.integer  "entry_order_id"
    t.integer  "exit_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
