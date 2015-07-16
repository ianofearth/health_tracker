class FixExercisesTableName < ActiveRecord::Migration
  def change
    rename_table :exercises_tables, :exercises
  end
end
