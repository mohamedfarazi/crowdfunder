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

ActiveRecord::Schema.define(version: 20140227221430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakpoints", force: true do |t|
    t.integer  "project_id"
    t.integer  "amount_in_cents"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "title"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  create_table "pledges", force: true do |t|
    t.integer  "breakpoint_id"
    t.integer  "project_id"
    t.integer  "backer_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges_backers", id: false, force: true do |t|
    t.integer "pledge_id"
    t.integer "user_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "goal_in_cents"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
