json.array!(@entry_orders) do |entry_order|
  json.extract! entry_order, :id, :date, :number, :client_id, :comments
  json.url entry_order_url(entry_order, format: :json)
end
