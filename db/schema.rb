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

ActiveRecord::Schema.define(version: 20170824173250) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.string   "unit_measurement"
    t.string   "presentation_to_take"
    t.integer  "dose"
    t.integer  "dose_every"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "periods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.integer  "treatment_id"
    t.string   "control"
    t.string   "control_missing"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["treatment_id"], name: "index_reminders_on_treatment_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "medicine_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_treatments_on_event_id"
    t.index ["medicine_id"], name: "index_treatments_on_medicine_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
