json.array!(@events) do |event|
  json.extract! event, :id, :memo
  json.start event.start
  json.end event.finish
  json.url event_path(event, format: :html)
end