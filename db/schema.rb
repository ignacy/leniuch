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

ActiveRecord::Schema.define(:version => 7) do

  create_table "engeeners", :force => true do |t|
    t.string  "imie"
    t.string  "nzwisko"
    t.string  "email"
    t.boolean "status",          :default => false
    t.string  "hashed_password"
    t.string  "salt"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tasks", :force => true do |t|
    t.string  "tresc"
    t.integer "pdone",                  :default => 0
    t.string  "engeener"
    t.integer "timetaken", :limit => 8, :default => 0
    t.date    "timeadded",              :default => '2009-06-05'
  end

end
