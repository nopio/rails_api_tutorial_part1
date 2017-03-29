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

ActiveRecord::Schema.define(version: 20170329210607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_name"], name: "index_authors_on_last_name", using: :btree
  end

  create_table "book_copies", force: :cascade do |t|
    t.integer  "book_id",    null: false
    t.string   "isbn",       null: false
    t.date     "published",  null: false
    t.integer  "format",     null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_copies_on_book_id", using: :btree
    t.index ["isbn"], name: "index_book_copies_on_isbn", using: :btree
    t.index ["user_id"], name: "index_book_copies_on_user_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
    t.index ["title"], name: "index_books_on_title", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "api_key"
    t.index ["api_key"], name: "index_users_on_api_key", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  add_foreign_key "book_copies", "books"
  add_foreign_key "book_copies", "users"
  add_foreign_key "books", "authors"
end
