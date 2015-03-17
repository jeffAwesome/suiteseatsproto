json.array!(@seats) do |seat|
  json.extract! seat, :id, :user_id, :row, :seat, :section
  json.url seat_url(seat, format: :json)
end
