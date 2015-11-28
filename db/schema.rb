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

ActiveRecord::Schema.define(version: 20151127142109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affixes", force: :cascade do |t|
    t.integer  "word_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "affixes", ["word_id"], name: "index_affixes_on_word_id", using: :btree

  create_table "definitions", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "language_id"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "etymologies", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "language_id"
    t.string   "etymology"
    t.string   "roman"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "etymologies", ["language_id"], name: "index_etymologies_on_language_id", using: :btree
  add_index "etymologies", ["word_id"], name: "index_etymologies_on_word_id", using: :btree

  create_table "examples", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "language_id"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jbo_classes", force: :cascade do |t|
    t.integer  "word_id"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jbo_classes", ["word_id"], name: "index_jbo_classes_on_word_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "language_id"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["language_id"], name: "index_notes_on_language_id", using: :btree
  add_index "notes", ["word_id"], name: "index_notes_on_word_id", using: :btree

  create_table "synonyms", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "language_id"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "synonyms", ["language_id"], name: "index_synonyms_on_language_id", using: :btree
  add_index "synonyms", ["word_id"], name: "index_synonyms_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "name"
    t.string   "jbo_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "affixes", "words"
  add_foreign_key "etymologies", "languages"
  add_foreign_key "etymologies", "words"
  add_foreign_key "jbo_classes", "words"
  add_foreign_key "notes", "languages"
  add_foreign_key "notes", "words"
  add_foreign_key "synonyms", "languages"
  add_foreign_key "synonyms", "words"
end
