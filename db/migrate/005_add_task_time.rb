class AddTaskTime < ActiveRecord::Migration
  def self.up
    add_column :tasks, :timetaken, :timestamp, :default => 0
  end

  def self.down
  end
end
