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

ActiveRecord::Schema.define(version: 20150103231224) do

  create_table "enrollments", force: true do |t|
    t.integer  "run_id"
    t.integer  "startnumber"
    t.integer  "transponder"
    t.time     "finishtime"
    t.string   "runner_title"
    t.string   "runner_name"
    t.string   "runner_firstname"
    t.string   "runner_street"
    t.string   "runner_city"
    t.string   "runner_zip"
    t.string   "runner_country"
    t.date     "runner_date_of_birth"
    t.string   "runner_gender"
    t.string   "runner_contact"
    t.string   "runner_email"
    t.string   "runner_organisation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "relay_id"
    t.string   "age_group"
    t.string   "run_slug"
    t.string   "public_id"
    t.boolean  "newsletter"
    t.boolean  "payed"
    t.boolean  "picked_up"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "relays", force: true do |t|
    t.integer  "run_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_title"
    t.string   "contact_name"
    t.string   "contact_firstname"
    t.string   "contact_street"
    t.string   "contact_city"
    t.string   "contact_zip"
    t.string   "contact_country"
    t.string   "contact_email"
    t.integer  "event_id"
    t.string   "age_group"
    t.integer  "startnumber"
    t.string   "run_slug"
    t.string   "public_id"
    t.boolean  "newsletter"
    t.boolean  "picked_up"
    t.boolean  "payed"
  end

  create_table "runs", force: true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.boolean  "relay"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.decimal  "price_adult_pre", precision: 4, scale: 2
    t.decimal  "price_child_pre", precision: 4, scale: 2
    t.decimal  "price_adult",     precision: 4, scale: 2
    t.decimal  "price_child",     precision: 4, scale: 2
    t.boolean  "minis"
    t.boolean  "kids"
    t.string   "slug"
  end

  add_index "runs", ["slug"], name: "index_runs_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
