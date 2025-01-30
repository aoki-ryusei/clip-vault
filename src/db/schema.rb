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

ActiveRecord::Schema[8.0].define(version: 2025_01_29_150455) do
  create_table "streamers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.string "email"
    t.string "profile_image_url"
    t.datetime "account_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code", "name"], name: "index_streamers_on_code_and_name", unique: true
  end

  create_table "token_storages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "streamer_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "video_created_at"
    t.datetime "video_published_at"
    t.string "url"
    t.string "thumbnail_url"
    t.integer "view_count"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["streamer_id"], name: "index_videos_on_streamer_id"
  end

  add_foreign_key "videos", "streamers"
end
