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

ActiveRecord::Schema.define(version: 20150914023333) do

  create_table "absences", force: :cascade do |t|
    t.text     "reason",     limit: 65535
    t.datetime "date"
    t.integer  "student_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "absences", ["student_id"], name: "index_absences_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "github",     limit: 255
    t.boolean  "graduate"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tardies", force: :cascade do |t|
    t.boolean  "less_than_15"
    t.text     "reason",       limit: 65535
    t.datetime "date"
    t.integer  "student_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tardies", ["student_id"], name: "index_tardies_on_student_id", using: :btree

end
