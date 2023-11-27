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

ActiveRecord::Schema.define(version: 2023_10_19_172206) do

  create_table "calories", force: :cascade do |t|
    t.string "name"
    t.integer "monday", default: 0
    t.integer "tuesday", default: 0
    t.integer "wednesday", default: 0
    t.integer "thursday", default: 0
    t.integer "friday", default: 0
    t.integer "saturday", default: 0
    t.integer "sunday", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fastings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.float "protein"
    t.float "carbohydrates"
    t.float "fat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meal_foods", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "food_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_meal_foods_on_food_id"
    t.index ["meal_id"], name: "index_meal_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weights", force: :cascade do |t|
    t.string "name"
    t.float "monday", default: 0.0
    t.float "tuesday", default: 0.0
    t.float "wednesday", default: 0.0
    t.float "thursday", default: 0.0
    t.float "friday", default: 0.0
    t.float "saturday", default: 0.0
    t.float "sunday", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "meal_foods", "foods"
  add_foreign_key "meal_foods", "meals"
end
