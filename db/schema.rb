# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 4) do

  create_table "engeeners", :force => true do |t|
    t.column "imie",            :string
    t.column "nzwisko",         :string
    t.column "email",           :string
    t.column "status",          :boolean, :default => false
    t.column "hashed_password", :string
    t.column "salt",            :string
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tasks", :force => true do |t|
    t.column "tresc",    :string
    t.column "pdone",    :integer, :default => 0
    t.column "engeener", :string
  end

end
