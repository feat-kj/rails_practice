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

ActiveRecord::Schema.define(version: 20170226145614) do

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.integer  "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "name"
    t.text     "keyword"
    t.integer  "sort"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.text     "name"
    t.integer  "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_auths", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email"], name: "index_user_auths_on_email", unique: true
    t.index ["user_id"], name: "index_user_auths_on_user_id", unique: true
  end

  create_table "user_genres", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "genre_id"], name: "index_user_genres_on_user_id_and_genre_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "profile"
    t.integer  "prefecture_id"
    t.integer  "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
