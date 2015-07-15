class AddFoodsTable < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.column :name, :string
      t.column :calories, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
