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

ActiveRecord::Schema.define(version: 20150731153622) do

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

  create_table "contact_people", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "position"
    t.string   "email"
    t.boolean  "decision_maker"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_people", ["client_id"], name: "index_contact_people_on_client_id"

  create_table "diagnostics", force: true do |t|
    t.datetime "date"
    t.text     "comments"
    t.integer  "transformer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnostics", ["transformer_id"], name: "index_diagnostics_on_transformer_id"

  create_table "entry_orders", force: true do |t|
    t.datetime "datetime"
    t.integer  "number"
    t.text     "comments"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_orders", ["client_id"], name: "index_entry_orders_on_client_id"

  create_table "exit_orders", force: true do |t|
    t.datetime "datetime"
    t.integer  "number"
    t.text     "comments"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exit_orders", ["client_id"], name: "index_exit_orders_on_client_id"

  create_table "records", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transformers", force: true do |t|
    t.string   "mark"
    t.string   "power"
    t.string   "number"
    t.integer  "diagnostic"
    t.text     "comments"
    t.integer  "entry_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transformers", ["entry_order_id"], name: "index_transformers_on_entry_order_id"

end
