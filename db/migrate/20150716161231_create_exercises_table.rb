class CreateExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises_tables do |t|
      t.column :name, :string
      t.column :burned, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
