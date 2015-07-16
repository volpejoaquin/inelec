json.array!(@orders) do |order|
  json.extract! order, :id, :number, :start_date, :comment, :client_id
  json.url order_url(order, format: :json)
end
