class FixTableName < ActiveRecord::Migration
  def change
    def self.up
      rename_table :exercises_tables, :exercises
    end
    def self.down
      rename_table :exercises, :exercises_tables
    end
  end
end
