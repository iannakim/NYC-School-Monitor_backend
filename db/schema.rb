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

ActiveRecord::Schema.define(version: 2020_10_27_190120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ap_courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boroughs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ell_programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lang_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "borough_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borough_id"], name: "index_neighborhoods_on_borough_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "school_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_reviews_on_school_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sas", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "ap_course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ap_course_id"], name: "index_sas_on_ap_course_id"
    t.index ["school_id"], name: "index_sas_on_school_id"
  end

  create_table "school_sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "grades"
    t.string "overview"
    t.string "start_time"
    t.string "end_time"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "subway"
    t.string "bus"
    t.string "shared_space"
    t.integer "accessibility"
    t.integer "total_students"
    t.integer "graduation_rate"
    t.integer "attendance_rate"
    t.string "extracurricular"
    t.float "longitude"
    t.float "latitude"
    t.bigint "neighborhood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["neighborhood_id"], name: "index_schools_on_neighborhood_id"
  end

  create_table "ses", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "ell_program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ell_program_id"], name: "index_ses_on_ell_program_id"
    t.index ["school_id"], name: "index_ses_on_school_id"
  end

  create_table "sls", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "lang_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lang_class_id"], name: "index_sls_on_lang_class_id"
    t.index ["school_id"], name: "index_sls_on_school_id"
  end

  create_table "sses", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "school_sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_sses_on_school_id"
    t.index ["school_sport_id"], name: "index_sses_on_school_sport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "neighborhoods", "boroughs"
  add_foreign_key "reviews", "schools"
  add_foreign_key "reviews", "users"
  add_foreign_key "sas", "ap_courses"
  add_foreign_key "sas", "schools"
  add_foreign_key "schools", "neighborhoods"
  add_foreign_key "ses", "ell_programs"
  add_foreign_key "ses", "schools"
  add_foreign_key "sls", "lang_classes"
  add_foreign_key "sls", "schools"
  add_foreign_key "sses", "school_sports"
  add_foreign_key "sses", "schools"
end
