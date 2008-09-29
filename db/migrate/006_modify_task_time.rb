class ModifyTaskTime < ActiveRecord::Migration
  def self.up
      change_column :tasks, :timetaken, :integer, :limit => 8, :default => 0
  end

  def self.down
  end
end
