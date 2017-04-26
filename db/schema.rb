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

ActiveRecord::Schema.define(version: 20170426205715) do

  create_table "apparatu_positions", force: :cascade do |t|
    t.integer  "apparatu_id"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "apparatus", force: :cascade do |t|
    t.string   "designator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "apparatus_class"
    t.integer  "apparatus_type"
    t.string   "name"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "apparatu_id"
    t.integer  "personnel_id"
    t.integer  "roster_id"
    t.integer  "position_id"
    t.boolean  "deploy",       default: false
    t.boolean  "alternate",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personnel_qualifications", force: :cascade do |t|
    t.integer  "personnel_id"
    t.integer  "qualification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "personnels", force: :cascade do |t|
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.boolean  "single_resource",        default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "shift"
  end

  add_index "personnels", ["confirmation_token"], name: "index_personnels_on_confirmation_token", unique: true
  add_index "personnels", ["email"], name: "index_personnels_on_email", unique: true
  add_index "personnels", ["reset_password_token"], name: "index_personnels_on_reset_password_token", unique: true

  create_table "positions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["name"], name: "index_positions_on_name", unique: true

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "acronym"
  end

  add_index "qualifications", ["name"], name: "index_qualifications_on_name", unique: true

  create_table "roster_apparatus", force: :cascade do |t|
    t.integer  "apparatu_id"
    t.integer  "roster_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.text     "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
