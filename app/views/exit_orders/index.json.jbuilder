json.array!(@exit_orders) do |exit_order|
  json.extract! exit_order, :id, :date, :number, :client_id, :comments
  json.url exit_order_url(exit_order, format: :json)
end
