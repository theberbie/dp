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

ActiveRecord::Schema.define(version: 20160910031524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "status"
  end

  add_index "bookings", ["post_id"], name: "index_bookings_on_post_id", using: :btree
  add_index "bookings", ["user_id", "post_id"], name: "index_bookings_on_user_id_and_post_id", using: :btree

  create_table "hosts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "bookings_id"
    t.integer  "identifier"
    t.string   "notice_type"
    t.boolean  "read",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["bookings_id"], name: "index_notifications_on_bookings_id", using: :btree
  add_index "notifications", ["notified_by_id"], name: "index_notifications_on_notified_by_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "pet_name"
    t.string   "pet_age"
    t.string   "pet_breed"
    t.string   "address_line"
    t.string   "zipcode"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "event_from"
    t.string   "event_to"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "sitters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "date_of_birth"
    t.string   "phone_number"
    t.string   "username"
    t.string   "profile_photo"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
