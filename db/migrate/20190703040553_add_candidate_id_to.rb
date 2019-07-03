class AddCandidateIdTo < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :candidate_id, :integer
    remove_column :records, :client, :string
  end
end
