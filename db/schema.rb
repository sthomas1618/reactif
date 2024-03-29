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

ActiveRecord::Schema.define(:version => 20121219074813) do

  create_table "comments", :force => true do |t|
    t.string   "remarks"
    t.integer  "reacting_with_id"
    t.integer  "user_id"
    t.integer  "reaction_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["reacting_with_id"], :name => "index_comments_on_reacting_with_id"
  add_index "comments", ["reaction_id"], :name => "index_comments_on_reaction_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "reactions", :force => true do |t|
    t.string   "title"
    t.string   "context"
    t.integer  "views"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "gif_file_name"
    t.string   "gif_content_type"
    t.integer  "gif_file_size"
    t.datetime "gif_updated_at"
    t.string   "gif_fingerprint"
    t.string   "short_url"
  end

  add_index "reactions", ["gif_fingerprint"], :name => "index_reactions_on_gif_fingerprint", :unique => true
  add_index "reactions", ["short_url"], :name => "index_reactions_on_short_url", :unique => true
  add_index "reactions", ["user_id"], :name => "index_reactions_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "reaction_id"
    t.integer  "tag_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "taggings", ["reaction_id"], :name => "index_taggings_on_reaction_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
