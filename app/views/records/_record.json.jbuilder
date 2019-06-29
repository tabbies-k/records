json.extract! record, :id, :candidate, :client, :status, :sales, :created_at, :updated_at
json.url record_url(record, format: :json)
