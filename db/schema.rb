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

ActiveRecord::Schema.define(version: 20171206004821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "display_address"
    t.string "business_hours"
    t.string "time_start"
    t.string "event_site_url"
    t.string "tickets_url"
    t.integer "cost"
    t.integer "cost_max"
    t.boolean "is_free"
    t.boolean "is_canceled"
    t.string "image_url"
    t.string "rating"
    t.string "price"
    t.string "display_phone"
    t.string "title"
    t.string "url"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "version"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_activities_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "begin_time"
    t.text "end_time"
    t.integer "budget"
    t.string "location"
    t.boolean "confirmed?"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.text "keywords", null: false
    t.text "events_categories", null: false
    t.text "business_categories", null: false
    t.text "google_places_types", null: false
    t.boolean "is_necessary?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "recommenders", force: :cascade do |t|
    t.text "event_matrix"
    t.text "business_matrix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.text "question_text"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer "survey_question_id"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_responses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "survey_question_id"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "agreed"
  end

  create_table "yelp_responses", force: :cascade do |t|
    t.string "name"
    t.string "display_address"
    t.string "time_start"
    t.string "event_site_url"
    t.string "tickets_url"
    t.integer "cost"
    t.integer "cost_max"
    t.boolean "is_free"
    t.boolean "is_canceled"
    t.string "image_url"
    t.string "rating"
    t.string "price"
    t.string "display_phone"
    t.string "title"
    t.string "url"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
