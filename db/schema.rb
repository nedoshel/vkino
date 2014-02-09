# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140209120717) do

  create_table "countries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "film_countries", force: true do |t|
    t.integer  "film_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "slogan"
    t.integer  "budget"
    t.decimal  "rating",      precision: 8, scale: 2
    t.float    "our_rating"
    t.integer  "duration"
    t.boolean  "is_viewed",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "views_count",                         default: 0
    t.string   "url"
  end

  create_table "genres", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "views", force: true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["viewable_id", "viewable_type"], name: "index_views_on_viewable_id_and_viewable_type", using: :btree

end
