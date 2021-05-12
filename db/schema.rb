# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_12_110910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.string "kind"
    t.string "subject"
    t.string "description"
    t.string "attendance"
    t.string "homework"
    t.string "performance"
    t.text "minitest"
    t.text "comment"
    t.text "other"
    t.string "credit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "mailsend", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "student_id", null: false
    t.string "unit_name"
    t.string "page"
    t.string "nexthw"
    t.index ["student_id"], name: "index_reports_on_student_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana"
    t.string "email", null: false
    t.integer "birthdate", null: false
    t.string "school", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
