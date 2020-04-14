json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :memo
  json.start schedule.start
  json.end schedule.finish
  json.url schedule_path(schedule, format: :html)
end