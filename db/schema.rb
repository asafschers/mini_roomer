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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121225164917) do

  create_table "hotels", :force => true do |t|
    t.string   "HotName"
    t.string   "HotChain"
    t.string   "HotState"
    t.string   "HotCity"
    t.string   "HotAddress"
    t.float    "HotLongitude"
    t.float    "HotLatitude"
    t.string   "HotEmail"
    t.integer  "HotPostalCode"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "ResConfirmationNum"
    t.datetime "ResCheckIn"
    t.datetime "ResCheckOut"
    t.integer  "ResNumAdults"
    t.integer  "ResNumChildren"
    t.string   "ResCancelationCause"
    t.string   "ResSource"
    t.integer  "HotelId"
    t.integer  "UserId"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "hotel_id"
  end

  add_index "reservations", ["HotelId"], :name => "index_reservations_on_HotelId"
  add_index "reservations", ["UserId"], :name => "index_reservations_on_UserId"
  add_index "reservations", ["hotel_id"], :name => "index_reservations_on_hotel_id"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "country"
    t.date     "date_of_birth"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
