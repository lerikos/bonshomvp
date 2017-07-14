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

ActiveRecord::Schema.define(version: 20170712125026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["alert_id"], name: "index_concerns_on_alert_id", using: :btree
    t.index ["tag_id"], name: "index_concerns_on_tag_id", using: :btree
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "preference_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tag_id"], name: "index_preferences_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_preferences_on_user_id", using: :btree
  end

  create_table "product_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tag_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_product_tags_on_product_id", using: :btree
    t.index ["tag_id"], name: "index_product_tags_on_tag_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "alert_id"
    t.text     "description"
    t.index ["alert_id"], name: "index_products_on_alert_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_subscribers_on_product_id", using: :btree
    t.index ["user_id"], name: "index_subscribers_on_user_id", using: :btree
  end

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
    t.boolean  "admin",                  default: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
