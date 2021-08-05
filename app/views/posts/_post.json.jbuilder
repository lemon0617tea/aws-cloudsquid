json.extract! post, :id, :body, :youtube_url, :name, :created_at, :updated_at
json.url post_url(post, format: :json)
