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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130328102410) do

  create_table "phrases", :force => true do |t|
    t.string   "lang"
    t.integer  "pos_id"
    t.string   "register"
    t.string   "properties"
    t.integer  "frequency"
    t.integer  "level"
    t.string   "phrase_class"
    t.string   "phrase_text"
    t.integer  "author_id"
    t.integer  "editor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "phrases", ["author_id", "created_at"], :name => "index_phrases_on_author_id_and_created_at"
  add_index "phrases", ["pos_id"], :name => "index_phrases_on_pos_id"

  create_table "pos", :force => true do |t|
    t.string   "pos_detail"
    t.string   "pos_class"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "lastLogin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
