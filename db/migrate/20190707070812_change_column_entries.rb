class ChangeColumnEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :user_id, :integer
    remove_column :entries, :candidate_id, :integer
  end
end
