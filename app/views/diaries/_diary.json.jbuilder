json.extract! diary, :id, :title, :text, :date, :created_at, :updated_at
json.url diary_url(diary, format: :json)
