json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :loc_city, :event_code, :visibility, :date
  json.url event_url(event, format: :json)
end
