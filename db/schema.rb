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

ActiveRecord::Schema.define(:version => 20131204004450) do

  create_table "blogs", :force => true do |t|
    t.string   "subdomain"
    t.integer  "user_id"
    t.text     "about"
    t.string   "title"
    t.string   "gender"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "interest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "blogs", ["subdomain"], :name => "index_blogs_on_subdomain", :unique => true
  add_index "blogs", ["user_id"], :name => "index_blogs_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "blog_id"
    t.string   "url"
    t.integer  "picture_file_size"
    t.string   "picture_content_type"
    t.string   "picture_file_name"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "urlpic"
    t.boolean  "active"
  end

  add_index "posts", ["blog_id"], :name => "index_posts_on_blog_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "facebook_uid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "perishable_token"
    t.string   "persistence_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
