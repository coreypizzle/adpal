json.array!(@events) do |event|
  json.extract! event, :id, :title, :date_and_time, :description
  json.url event_url(event, format: :json)
end
