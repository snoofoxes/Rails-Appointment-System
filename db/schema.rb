# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_10_074252) do
  create_table "appointments", force: :cascade do |t|
    t.integer "dentist_id", null: false
    t.integer "user_id", null: false
    t.string "branch"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "selected_time"
    t.index ["dentist_id"], name: "index_appointments_on_dentist_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "dentists", force: :cascade do |t|
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.date "birthdate"
    t.integer "phone_number"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.date "birthdate"
    t.integer "phone_number"
    t.integer "age"
    t.text "medicalhistory"
  end

  add_foreign_key "appointments", "dentists"
  add_foreign_key "appointments", "dentists"
  add_foreign_key "appointments", "users"
end
