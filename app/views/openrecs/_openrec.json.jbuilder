json.extract! openrec, :id, :openrec_url, :body, :name, :user_id, :created_at, :updated_at
json.url openrec_url(openrec, format: :json)
