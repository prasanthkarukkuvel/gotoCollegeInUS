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

ActiveRecord::Schema.define(:version => 20130226141831) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_roles", :force => true do |t|
    t.boolean  "handle_page_requests", :default => false
    t.boolean  "handle_users",         :default => false
    t.boolean  "handle_pages",         :default => false
    t.boolean  "handle_professors",    :default => false
    t.boolean  "handle_Reports",       :default => false
    t.boolean  "can_delete",           :default => false
    t.boolean  "can_edit",             :default => false
    t.boolean  "is_active",            :default => false
    t.boolean  "show_all_details",     :default => false
    t.boolean  "send_emails",          :default => false
    t.integer  "admin_user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "admin_roles", ["admin_user_id"], :name => "admin_roles_admin_user_id_fk"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "page_activates", :force => true do |t|
    t.string   "key",           :null => false
    t.string   "note"
    t.integer  "admin_user_id", :null => false
    t.integer  "page_id",       :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "page_activates", ["admin_user_id"], :name => "page_activates_admin_user_id_fk"
  add_index "page_activates", ["page_id"], :name => "page_activates_page_id_fk"

  create_table "page_admins", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.integer  "page_id",    :null => false
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_admins", ["page_id"], :name => "page_admins_page_id_fk"

  create_table "page_infos", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.string   "website"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "fax"
    t.integer  "page_id",    :null => false
    t.string   "desc"
    t.string   "slug"
    t.string   "key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_infos", ["page_id"], :name => "page_infos_page_id_fk"

  create_table "pages", :force => true do |t|
    t.integer  "status"
    t.string   "key"
    t.integer  "ptype"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "professors", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "contact"
    t.string   "email",       :null => false
    t.string   "username",    :null => false
    t.string   "password",    :null => false
    t.string   "department"
    t.string   "designation"
    t.integer  "isactive"
    t.string   "key",         :null => false
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_activates", :force => true do |t|
    t.string   "akey",       :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_activates", ["user_id"], :name => "user_activates_user_id_fk"

  create_table "user_infos", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "pincode"
    t.string   "college"
    t.integer  "yearofpassing"
    t.decimal  "gre",           :precision => 10, :scale => 0
    t.decimal  "toefl",         :precision => 10, :scale => 0
    t.decimal  "transit",       :precision => 10, :scale => 0
    t.integer  "user_id",                                      :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "user_infos", ["user_id"], :name => "user_infos_user_id_fk"

  create_table "usernames", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "ntype",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname",          :null => false
    t.string   "lastname",           :null => false
    t.string   "email",              :null => false
    t.string   "contact",            :null => false
    t.string   "password",           :null => false
    t.string   "dob",                :null => false
    t.string   "gender",             :null => false
    t.string   "slug"
    t.string   "key",                :null => false
    t.string   "username"
    t.boolean  "ispaid"
    t.boolean  "isactive"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["key"], :name => "index_users_on_key"
  add_index "users", ["slug"], :name => "index_users_on_slug"

  add_foreign_key "admin_roles", "admin_users", :name => "admin_roles_admin_user_id_fk", :dependent => :delete

  add_foreign_key "page_activates", "admin_users", :name => "page_activates_admin_user_id_fk", :dependent => :delete
  add_foreign_key "page_activates", "pages", :name => "page_activates_page_id_fk", :dependent => :delete

  add_foreign_key "page_admins", "pages", :name => "page_admins_page_id_fk", :dependent => :delete

  add_foreign_key "page_infos", "pages", :name => "page_infos_page_id_fk", :dependent => :delete

  add_foreign_key "user_activates", "users", :name => "user_activates_user_id_fk", :dependent => :delete

  add_foreign_key "user_infos", "users", :name => "user_infos_user_id_fk", :dependent => :delete

end
