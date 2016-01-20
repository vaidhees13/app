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

ActiveRecord::Schema.define(version: 20160105074100) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_documents", id: false, force: :cascade do |t|
    t.integer "client_id",   null: false
    t.integer "document_id", null: false
  end

  add_index "clients_documents", ["client_id", "document_id"], name: "index_clients_documents_on_client_id_and_document_id"
  add_index "clients_documents", ["document_id", "client_id"], name: "index_clients_documents_on_document_id_and_client_id"

  create_table "clients_teams", id: false, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "team_id",   null: false
  end

  add_index "clients_teams", ["client_id", "team_id"], name: "index_clients_teams_on_client_id_and_team_id"
  add_index "clients_teams", ["team_id", "client_id"], name: "index_clients_teams_on_team_id_and_client_id"

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "team_name"
    t.string   "summary"
    t.string   "ref_link"
    t.string   "file_path"
    t.integer  "client_ids"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "content_type"
    t.string   "fileimg_path"
    t.string   "file_name"
    t.string   "file_image"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "admin"
    t.integer  "role_id"
  end

end
