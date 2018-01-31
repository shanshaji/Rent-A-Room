json.extract! booking, :id, :start_date, :end_date, :user_id, :room_id, :is_confirmed, :price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
