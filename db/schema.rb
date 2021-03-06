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

ActiveRecord::Schema.define(version: 20150322135133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "first",               limit: 30
    t.string   "last",                limit: 30
    t.string   "password_digest"
    t.string   "email",                          null: false
    t.string   "title"
    t.integer  "company_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["company_id"], name: "index_admins_on_company_id", unique: true, using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "moto"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "followed_jobs", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.boolean  "applied",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followed_jobs", ["user_id", "job_id"], name: "index_followed_jobs_on_user_id_and_job_id", unique: true, using: :btree

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["admin_id"], name: "index_jobs_on_admin_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.string   "proficiency"
    t.integer  "skillable_id"
    t.string   "skillable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["skillable_id", "skillable_type"], name: "index_skills_on_skillable_id_and_skillable_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "first",               limit: 30
    t.string   "last",                limit: 30
    t.string   "password_digest"
    t.string   "email"
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
