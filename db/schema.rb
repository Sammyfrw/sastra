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

ActiveRecord::Schema.define(version: 20140806190925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "body",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "book_authors", id: false, force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "book_id",    null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_authors", ["author_id"], name: "index_book_authors_on_author_id", using: :btree
  add_index "book_authors", ["book_id"], name: "index_book_authors_on_book_id", using: :btree

  create_table "book_publishers", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "book_id",      null: false
    t.integer  "publisher_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_publishers", ["book_id"], name: "index_book_publishers_on_book_id", using: :btree
  add_index "book_publishers", ["publisher_id"], name: "index_book_publishers_on_publisher_id", using: :btree

  create_table "book_shops", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "book_id",      null: false
    t.integer  "book_shop_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_shops", ["book_id"], name: "index_book_shops_on_book_id", using: :btree
  add_index "book_shops", ["book_shop_id"], name: "index_book_shops_on_book_shop_id", using: :btree

  create_table "bookmark_relationships", force: true do |t|
    t.integer  "bookmarked_user_id", null: false
    t.integer  "bookmarker_id",      null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "bookmark_relationships", ["bookmarked_user_id"], name: "index_bookmark_relationships_on_bookmarked_user_id", using: :btree
  add_index "bookmark_relationships", ["bookmarker_id", "bookmarked_user_id"], name: "bookmark_relationships_index_unique_constraint", unique: true, using: :btree
  add_index "bookmark_relationships", ["bookmarker_id"], name: "index_bookmark_relationships_on_bookmarker_id", using: :btree

  create_table "books", force: true do |t|
    t.integer "author_id",                    null: false
    t.integer "owner_id"
    t.string  "title",                        null: false
    t.string  "genre",                        null: false
    t.string  "status",                       null: false
    t.string  "format",                       null: false
    t.string  "edition"
    t.integer "publisher_id"
    t.date    "published"
    t.integer "ISBN_10"
    t.integer "ISBN_13"
    t.integer "bookshop_id"
    t.boolean "verified",     default: false, null: false
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["bookshop_id"], name: "index_books_on_bookshop_id", using: :btree
  add_index "books", ["owner_id"], name: "index_books_on_owner_id", using: :btree
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id", using: :btree

  create_table "shouts", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.string   "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
