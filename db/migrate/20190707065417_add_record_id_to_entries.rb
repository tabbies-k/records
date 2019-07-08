class AddRecordIdToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :record_id, :integer
  end
end
