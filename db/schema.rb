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

ActiveRecord::Schema.define(version: 2021_05_05_125519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "eye_color"
    t.string "gender"
    t.string "hair_color"
    t.string "height"
    t.string "mass"
    t.string "skin_color"
    t.string "homeworld"
    t.text "species", default: [], array: true
    t.text "starships", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "starship_possessions", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_starship_possessions_on_person_id"
    t.index ["starship_id"], name: "index_starship_possessions_on_starship_id"
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "starship_class"
    t.string "manufacturer"
    t.string "cost_in_credits"
    t.string "length"
    t.string "crew"
    t.string "passengers"
    t.string "max_atmosphering_speed"
    t.string "hyperdrive_rating"
    t.string "MGLT"
    t.string "cargo_capacity"
    t.string "consumables"
    t.text "pilots", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "starship_possessions", "people"
  add_foreign_key "starship_possessions", "starships"
end
