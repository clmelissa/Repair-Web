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

ActiveRecord::Schema.define(version: 4) do

  create_table "repairs", force: :cascade do |t|
    t.string   "THnum"
    t.string   "phone"
    t.text     "problem"
    t.string   "ticketNum"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "week"
    t.integer  "user_id"
    t.string   "phoneNum"
    t.string   "IMEI"
  end

  create_table "updates", force: :cascade do |t|
    t.text     "comment"
    t.text     "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repairs_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "dept"
    t.string   "GLnum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
