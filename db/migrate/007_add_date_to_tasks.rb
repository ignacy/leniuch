class AddDateToTasks < ActiveRecord::Migration
  def self.up
     add_column :tasks, :timeadded, :date, :default => Time.now.to_date
  end

  def self.down
  end
end
