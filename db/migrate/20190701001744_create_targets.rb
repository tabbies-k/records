class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.integer :year
      t.integer :month
      t.integer :user_id
      t.integer :target_sales

      t.timestamps
    end
  end
end
