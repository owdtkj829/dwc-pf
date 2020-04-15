json.extract! event, :id, :artist_id, :venue, :start, :finish, :share, :url, :memo
json.url event_url(event, format: :json)