json.extract! myblog, :id, :title, :user_id, :abstract, :content, :created_at, :updated_at
json.url myblog_url(myblog, format: :json)
