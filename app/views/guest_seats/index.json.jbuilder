json.array!(@guest_seats) do |guest_seat|
  json.extract! guest_seat, :id, :user_id, :row, :seat, :section
  json.url guest_seat_url(guest_seat, format: :json)
end
