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

ActiveRecord::Schema.define(version: 20170202222216) do

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "liked_count",             default: 0
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.integer  "likes_count",             default: 0
    t.index ["cached_votes_down"], name: "index_images_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_images_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_images_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_images_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_images_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_images_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_images_on_cached_weighted_total"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_likes_on_image_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "follows_count",   default: 0
    t.integer  "followers_count", default: 0
  end

end
