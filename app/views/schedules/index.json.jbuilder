json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :day, :hour
  json.url schedule_url(schedule, format: :json)
end
