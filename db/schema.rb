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

ActiveRecord::Schema.define(version: 2020_07_08_143817) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.integer "popularity"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "connector_id"
    t.integer "connectee_id"
    t.float "strength"
  end

  create_table "rejections", force: :cascade do |t|
    t.integer "rejector_id"
    t.integer "rejectee_id"
    t.float "strength"
  end

  create_table "user_artists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "city"
    t.string "email"
  end

end
