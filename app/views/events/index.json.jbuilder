json.array!(@events) do |event|
  json.extract! event, :id, :event, :date
  json.url event_url(event, format: :json)
end
