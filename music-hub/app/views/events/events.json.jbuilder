json.array!(@events) do |event|
  json.user_id event.user_id
  json.artist_id event.artist_id
  json.start event.start
  json.finish event.finish
  json.memo event.memo
  json.venue event.venue
end
