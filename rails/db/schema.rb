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

ActiveRecord::Schema.define(version: 20150720004416) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id"

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jack_invitations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "jack_id"
  end

  add_index "jack_invitations", ["jack_id"], name: "index_jack_invitations_on_jack_id"
  add_index "jack_invitations", ["user_id"], name: "index_jack_invitations_on_user_id"

  create_table "jacks", force: :cascade do |t|
    t.string   "name"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jacks", ["deck_id"], name: "index_jacks_on_deck_id"

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "netid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["netid"], name: "index_students_on_netid"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
