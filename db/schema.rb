# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090326140700) do

  create_table "group_permissions", :force => true do |t|
    t.integer "user_id",                     :null => false
    t.integer "group_id",                    :null => false
    t.boolean "can_view", :default => false, :null => false
    t.boolean "can_edit", :default => false, :null => false
  end

  create_table "groups", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "page_part_revisions", :force => true do |t|
    t.integer  "page_part_id",                    :null => false
    t.integer  "user_id",                         :null => false
    t.datetime "created_at",                      :null => false
    t.text     "body",                            :null => false
    t.boolean  "was_deleted",  :default => false, :null => false
    t.string   "summary"
  end

  create_table "page_parts", :force => true do |t|
    t.string  "name",                          :null => false
    t.integer "page_id",                       :null => false
    t.integer "current_page_part_revision_id", :null => false
  end

  create_table "page_permissions", :force => true do |t|
    t.integer "page_id",                       :null => false
    t.integer "group_id",                      :null => false
    t.boolean "can_view",   :default => false, :null => false
    t.boolean "can_edit",   :default => false, :null => false
    t.boolean "can_manage", :default => false, :null => false
  end

  create_table "pages", :force => true do |t|
    t.string  "title",     :null => false
    t.string  "sid"
    t.integer "parent_id"
    t.integer "lft",       :null => false
    t.integer "rgt",       :null => false
    t.string  "layout"
  end

  add_index "pages", ["sid"], :name => "index_pages_on_sid"

  create_table "uploaded_files", :force => true do |t|
    t.integer "size"
    t.string  "content_type"
    t.string  "filename"
    t.integer "page_id"
  end

  create_table "users", :force => true do |t|
    t.string "username",               :null => false
    t.string "name",                   :null => false
    t.string "token",    :limit => 32, :null => false
  end

  add_index "users", ["token"], :name => "index_users_on_token", :unique => true

end
