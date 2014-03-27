json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :lesson_date, :turn, :goal, :song, :homework, :user_id
  json.url lesson_url(lesson, format: :json)
end
