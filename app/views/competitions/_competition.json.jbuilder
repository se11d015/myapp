json.extract! competition, :id, :name, :image, :left_time, :participants_number, :details, :created_at, :updated_at
json.url competition_url(competition, format: :json)
