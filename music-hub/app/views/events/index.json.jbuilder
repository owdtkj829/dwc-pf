json.array!(@event) do |event|
  json.extract! event, :id, :artist_id, :user_id
  json.start event.start
  json.finish event.finish
  json.url event_url(event, format: :html)
end