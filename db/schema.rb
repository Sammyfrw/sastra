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

ActiveRecord::Schema.define(version: 20140815154912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer "user_id",       null: false
    t.integer "feedable_id",   null: false
    t.string  "feedable_type", null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "announcements", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "body",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "authors", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_authors", id: false, force: true do |t|
    t.integer  "book_id",    null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_authors", ["author_id"], name: "index_book_authors_on_author_id", using: :btree
  add_index "book_authors", ["book_id"], name: "index_book_authors_on_book_id", using: :btree

  create_table "book_publishers", id: false, force: true do |t|
    t.integer  "book_id",      null: false
    t.integer  "publisher_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_publishers", ["book_id"], name: "index_book_publishers_on_book_id", using: :btree
  add_index "book_publishers", ["publisher_id"], name: "index_book_publishers_on_publisher_id", using: :btree

  create_table "book_shops", id: false, force: true do |t|
    t.integer  "book_id",    null: false
    t.integer  "shop_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_shops", ["book_id"], name: "index_book_shops_on_book_id", using: :btree
  add_index "book_shops", ["shop_id"], name: "index_book_shops_on_shop_id", using: :btree

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
    t.string  "title",                       null: false
    t.string  "genre",                       null: false
    t.string  "status",                      null: false
    t.string  "format",                      null: false
    t.string  "edition"
    t.date    "published"
    t.integer "ISBN_10"
    t.integer "ISBN_13"
    t.boolean "verified",    default: false, null: false
    t.string  "image_url",   default: "",    null: false
    t.text    "description", default: "",    null: false
  end

  create_table "bookshops", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id",                       null: false
    t.string   "commentable_type",              null: false
    t.integer  "commentable_id",                null: false
    t.text     "text",             default: "", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "features", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "feature_type",              null: false
    t.integer  "feature_id",                null: false
    t.string   "image",        default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "features", ["user_id"], name: "index_features_on_user_id", using: :btree

  create_table "partner_relationships", force: true do |t|
    t.integer  "partnered_user_id",                                                     null: false
    t.integer  "partner_id",                                                            null: false
    t.string   "message",           default: "Hello! Would you like to be my partner?", null: false
    t.boolean  "accepted",          default: false,                                     null: false
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "partner_relationships", ["partner_id", "partnered_user_id"], name: "partner_relationships_index_unique_constraint", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",                             null: false
    t.string   "name",         default: "",           null: false
    t.string   "pen_name",     default: "",           null: false
    t.integer  "age",          default: 0,            null: false
    t.string   "gender",       default: "",           null: false
    t.date     "birthday",     default: '1910-01-01', null: false
    t.string   "country",      default: "",           null: false
    t.string   "address",      default: "",           null: false
    t.string   "city",         default: "",           null: false
    t.string   "state",        default: "",           null: false
    t.integer  "zipcode",      default: 0,            null: false
    t.string   "website",      default: "",           null: false
    t.string   "avatar",       default: "",           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "account_type", default: "Reader",     null: false
    t.integer  "account_id",   default: 0,            null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "publishers", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shouts", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.string   "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "snippets", force: true do |t|
    t.integer  "user_id",                     null: false
    t.string   "book",           default: "", null: false
    t.integer  "page",           default: 0,  null: false
    t.integer  "chapter",        default: 0,  null: false
    t.text     "snippet_text",   default: "", null: false
    t.string   "snippet_source", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "snippets", ["user_id"], name: "index_snippets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
