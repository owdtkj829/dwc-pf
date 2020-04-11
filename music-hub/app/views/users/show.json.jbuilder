json.array!(@schedule) do |event|
  json.extract! schedule, :id, :memo
  json.start schedule.start
  json.end schedule.finish
  json.url url(schedule, format: :html)
end