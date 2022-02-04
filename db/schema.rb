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

ActiveRecord::Schema.define(version: 2022_02_04_044211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addings", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "keyword_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_id"], name: "index_addings_on_diary_id"
    t.index ["keyword_id"], name: "index_addings_on_keyword_id"
  end

  create_table "connotations", force: :cascade do |t|
    t.string "connotation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "diaries", force: :cascade do |t|
    t.date "date"
    t.string "title", null: false
    t.string "story", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "word", null: false
    t.string "description", null: false
    t.string "furigana", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "laughs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_id"], name: "index_laughs_on_diary_id"
    t.index ["user_id", "diary_id"], name: "index_laughs_on_user_id_and_diary_id", unique: true
    t.index ["user_id"], name: "index_laughs_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_id"], name: "index_likes_on_diary_id"
    t.index ["user_id", "diary_id"], name: "index_likes_on_user_id_and_diary_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "meanings", force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.bigint "connotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connotation_id"], name: "index_meanings_on_connotation_id"
    t.index ["keyword_id"], name: "index_meanings_on_keyword_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addings", "diaries"
  add_foreign_key "addings", "keywords"
  add_foreign_key "diaries", "users"
  add_foreign_key "laughs", "diaries"
  add_foreign_key "laughs", "users"
  add_foreign_key "likes", "diaries"
  add_foreign_key "likes", "users"
  add_foreign_key "meanings", "connotations"
  add_foreign_key "meanings", "keywords"
end
