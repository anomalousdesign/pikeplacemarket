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

ActiveRecord::Schema.define(:version => 20130426145410) do

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

  create_table "editable_images", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "editable_images", ["name"], :name => "index_editable_images_on_name"

  create_table "editables", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "editables", ["name"], :name => "index_editables_on_name"

  create_table "events", :force => true do |t|
    t.string   "title",      :limit => 250, :null => false
    t.datetime "start",                     :null => false
    t.datetime "end",                       :null => false
    t.text     "details",                   :null => false
    t.boolean  "featured",                  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "slug"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug"

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
    t.string   "slug"
  end

  add_index "merchants", ["slug"], :name => "index_merchants_on_slug"

  create_table "old_tags", :force => true do |t|
    t.string "name",          :limit => 50,  :null => false
    t.string "value",         :limit => 100, :null => false
    t.string "linkage_table", :limit => 25,  :null => false
  end

  create_table "pages", :force => true do |t|
    t.boolean  "publish",                    :default => false, :null => false
    t.integer  "position",                   :default => 0,     :null => false
    t.string   "template",    :limit => 100, :default => "",    :null => false
    t.string   "title",                      :default => "",    :null => false
    t.text     "keywords",                                      :null => false
    t.text     "description",                                   :null => false
    t.string   "link"
    t.datetime "live_start"
    t.datetime "live_end"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"
  add_index "pages", ["slug"], :name => "index_pages_on_slug"

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
