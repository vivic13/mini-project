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

ActiveRecord::Schema.define(version: 20170528173401) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.integer  "plan_id"
    t.text     "comment_body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "file_location"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "donations", force: :cascade do |t|
    t.string   "cc_name"
    t.integer  "amount"
    t.integer  "plan_id"
    t.integer  "npo_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.string   "status",         default: "pending"
    t.string   "payment_status", default: "pending"
    t.index ["npo_id"], name: "index_donations_on_npo_id"
    t.index ["plan_id"], name: "index_donations_on_plan_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_memberships_on_plan_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "npos", force: :cascade do |t|
    t.integer  "npo_code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "donation_id"
    t.string   "payment_method"
    t.integer  "amount"
    t.datetime "paid_at"
    t.text     "params"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["donation_id"], name: "index_payments_on_donation_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "plan_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "title"
    t.date     "duedate"
    t.text     "plan"
    t.text     "do_what"
    t.text     "check"
    t.text     "act"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_public",                  default: false
    t.string   "progress",                   default: "剛決定願望"
    t.string   "host"
    t.text     "why"
    t.integer  "comments_count",             default: 0,       null: false
    t.integer  "page_view",                  default: 0,       null: false
    t.string   "file_location_file_name"
    t.string   "file_location_content_type"
    t.integer  "file_location_file_size"
    t.datetime "file_location_updated_at"
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_plan_rps", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "tag_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "nickname"
    t.string   "last_name"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "role",                   default: "user"
    t.text     "introduction"
    t.string   "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

end
