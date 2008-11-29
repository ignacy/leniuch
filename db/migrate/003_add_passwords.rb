class AddPasswords < ActiveRecord::Migration
  def self.up
    add_column :engeeners, :hashed_password, :string
    add_column :engeeners, :salt,            :string
  end

  def self.down
  end
end
