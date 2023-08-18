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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_043240) do
  create_table "battings", force: :cascade do |t|
    t.string "format"
    t.integer "matches"
    t.integer "innings"
    t.integer "runs"
    t.integer "balls"
    t.integer "highest"
    t.integer "fours"
    t.integer "sixes"
    t.integer "fif"
    t.integer "hun"
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notout"
    t.float "strikerate"
    t.float "avg"
    t.index ["player_id"], name: "index_battings_on_player_id"
  end

  create_table "bowlings", force: :cascade do |t|
    t.string "format"
    t.integer "matches"
    t.integer "innings"
    t.integer "balls"
    t.integer "runs"
    t.integer "maidens"
    t.integer "wickets"
    t.integer "fourw"
    t.integer "fifw"
    t.string "bbi"
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "strikerate"
    t.string "avg"
    t.string "economy"
    t.index ["player_id"], name: "index_bowlings_on_player_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.integer "user_id"
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "playername"
    t.string "born"
    t.string "birthplace"
    t.string "nickname"
    t.string "role"
    t.string "battingstyle"
    t.string "bowling"
    t.string "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "playername"
    t.string "born"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
  end

  add_foreign_key "battings", "players"
  add_foreign_key "bowlings", "players"
  add_foreign_key "comments", "players"
  add_foreign_key "comments", "users"
end
