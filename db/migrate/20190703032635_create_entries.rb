class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.string :client
      t.string :entry_status
      t.date :interview_day
      t.integer :expected_sales
      t.string :rank

      t.timestamps
    end
  end
end
