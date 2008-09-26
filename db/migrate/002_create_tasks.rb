class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.column :tresc, :string
      t.column :pdone, :integer, :default =>0
      t.column :engeener, :string
    end
  end

  def self.down
    drop_table :tasks
  end
end
