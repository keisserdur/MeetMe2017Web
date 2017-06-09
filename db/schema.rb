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

ActiveRecord::Schema.define(version: 20170419155816) do

  create_table "contacts", force: :cascade do |t|
    t.string   "tokenuser"
    t.string   "tokencontact"
    t.string   "lastsync"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "group_lists", force: :cascade do |t|
    t.string   "topic"
    t.string   "tokenuser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "topic"
    t.string   "tokenlist" #¿?
    t.string   "photo"
    t.string   "description"
    t.string   "tokenadminrails" #¿? tokenadmin
    t.string   "generate" #¿?
    t.string   "model" #¿?
    t.string   "GroupList" #¿?
    t.string   "tokenuser" #¿?
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "tokenuser"
    t.string   "type"
    t.string   "content"
    t.string   "tokencontact"
    t.string   "day"
    t.string   "time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.string   "name"
    t.string   "nick"
    t.integer  "tlf"
    t.string   "email"
    t.string   "photo"
    t.string   "status"
    t.string   "lastconexion"
    t.string   "privacity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
