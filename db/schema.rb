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

ActiveRecord::Schema.define(version: 20170516210917) do

  create_table "alerts", force: :cascade do |t|
    t.string   "title"
    t.text     "issue"
    t.text     "action"
    t.string   "source"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concerns", force: :cascade do |t|
    t.integer  "alert_id"
    t.integer  "tag_id"
    t.datetime "concern_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concerns", ["alert_id"], name: "index_concerns_on_alert_id"
  add_index "concerns", ["tag_id"], name: "index_concerns_on_tag_id"

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "preference_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["tag_id"], name: "index_preferences_on_tag_id"
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "alert_id"
  end

  add_index "products", ["alert_id"], name: "index_products_on_alert_id"
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
