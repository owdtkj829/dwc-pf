json.array!(@events) do |event|
  json.extract! event, :id,:artist_id, :memo, :name
  json.start event.start
  json.end event.finish
  json.url event_path(event, format: :html)
end