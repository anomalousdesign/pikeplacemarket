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

ActiveRecord::Schema.define(:version => 20130425152521) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "events", :force => true do |t|
    t.string   "title",      :limit => 250, :null => false
    t.datetime "start",                     :null => false
    t.datetime "end",                       :null => false
    t.text     "details",                   :null => false
    t.boolean  "featured",                  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "merchants", :force => true do |t|
    t.string   "title",           :limit => 100, :null => false
    t.string   "sub_title",       :limit => 100, :null => false
    t.string   "phone",           :limit => 20,  :null => false
    t.string   "address",         :limit => 250, :null => false
    t.string   "city",            :limit => 100, :null => false
    t.string   "state",           :limit => 100, :null => false
    t.string   "zip",             :limit => 20,  :null => false
    t.string   "email",           :limit => 200, :null => false
    t.string   "link",            :limit => 250, :null => false
    t.string   "hours",           :limit => 100, :null => false
    t.string   "market_location", :limit => 200, :null => false
    t.text     "about",                          :null => false
    t.text     "tags",                           :null => false
    t.integer  "map_x",                          :null => false
    t.integer  "map_y",                          :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "old_tags", :force => true do |t|
    t.string "name",          :limit => 50,  :null => false
    t.string "value",         :limit => 100, :null => false
    t.string "linkage_table", :limit => 25,  :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer  "user_id",                                        :null => false
    t.datetime "timestamp",                                      :null => false
    t.boolean  "publish",                     :default => false, :null => false
    t.boolean  "featured",                                       :null => false
    t.text     "feature_text",                                   :null => false
    t.string   "subtitle",     :limit => 100,                    :null => false
    t.boolean  "private",                                        :null => false
    t.string   "url",          :limit => 250,                    :null => false
    t.string   "link",         :limit => 250,                    :null => false
    t.integer  "nav_order",                   :default => 0,     :null => false
    t.string   "nav_group",    :limit => 50,  :default => "",    :null => false
    t.string   "template",     :limit => 100,                    :null => false
    t.string   "plugin",       :limit => 100,                    :null => false
    t.string   "title",        :limit => 250,                    :null => false
    t.string   "keywords",                                       :null => false
    t.string   "description",                                    :null => false
    t.text     "content1",                                       :null => false
    t.text     "content2",                                       :null => false
    t.text     "content3",                                       :null => false
    t.datetime "live_start",                                     :null => false
    t.datetime "live_end",                                       :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "subscribers", :force => true do |t|
    t.string    "name",       :limit => 250, :null => false
    t.string    "email",      :limit => 250, :null => false
    t.datetime  "created_at",                :null => false
    t.timestamp "updated_at", :limit => 6,   :null => false
  end

  create_table "timeline_events", :force => true do |t|
    t.string   "title",      :limit => 250, :null => false
    t.integer  "year",                      :null => false
    t.text     "content",                   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
