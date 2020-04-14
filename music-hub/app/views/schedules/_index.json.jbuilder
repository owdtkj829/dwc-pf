json.extract! schedule, :id,:artist_id, :memo, :name, :start, :finish, :url, :memo, :share, :favorite_id, :created_at, :updated_at
json.url schedule_path(schedule, format: :html)

json.array!(@schedules) do |schedule|
  json.extract! schedule, :id,:artist_id, :memo, :name
  json.start schedule.start
  json.end schedule.finish
  json.url schedule_path(schedule, format: :html)
end