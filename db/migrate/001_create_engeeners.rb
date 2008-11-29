class CreateEngeeners < ActiveRecord::Migration
  def self.up
    create_table :engeeners do |t|
      t.column :imie, :string
      t.column :nzwisko, :string
      t.column :email, :string
      t.column :status, :boolean, :default => 0
    end
  end

  def self.down
    drop_table :engeeners
  end
end
