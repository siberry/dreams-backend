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

ActiveRecord::Schema.define(version: 2019_06_06_213406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artsy_xapp_tokens", force: :cascade do |t|
    t.string "token"
    t.string "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dream_tags", force: :cascade do |t|
    t.string "tag_name"
    t.string "interpretation"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url"
    t.boolean "change_image"
    t.string "img_source"
  end

  create_table "dreams", force: :cascade do |t|
    t.string "dream"
    t.string "date"
    t.integer "hours_slept"
    t.string "quality"
    t.string "state_of_mind"
    t.string "image_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreams_on_user_id"
  end

  create_table "specific_dream_tags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dream_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dream_tag_id"], name: "index_specific_dream_tags_on_dream_tag_id"
    t.index ["user_id"], name: "index_specific_dream_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dreams", "users"
  add_foreign_key "specific_dream_tags", "dream_tags"
  add_foreign_key "specific_dream_tags", "users"
end
