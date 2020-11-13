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

ActiveRecord::Schema.define(version: 2020_11_13_044622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boroughs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "joiners", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_joiners_on_option_id"
    t.index ["school_id"], name: "index_joiners_on_school_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "borough_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borough_id"], name: "index_neighborhoods_on_borough_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_options_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "saveds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_saveds_on_school_id"
    t.index ["user_id"], name: "index_saveds_on_user_id"
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
    t.string "accessibility"
    t.integer "total_students"
    t.string "graduation_rate"
    t.string "attendance_rate"
    t.string "langclasses"
    t.string "ellprograms"
    t.string "apcourses"
    t.string "extracurricular"
    t.float "longitude"
    t.float "latitude"
    t.bigint "neighborhood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["neighborhood_id"], name: "index_schools_on_neighborhood_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "joiners", "options"
  add_foreign_key "joiners", "schools"
  add_foreign_key "neighborhoods", "boroughs"
  add_foreign_key "options", "programs"
  add_foreign_key "reviews", "schools"
  add_foreign_key "reviews", "users"
  add_foreign_key "saveds", "schools"
  add_foreign_key "saveds", "users"
  add_foreign_key "schools", "neighborhoods"
end
