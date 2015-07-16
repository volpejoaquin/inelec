json.array!(@clients) do |client|
  json.extract! client, :id, :name, :address, :city, :category_id, :postal_code, :phone, :email, :cuit
  json.url client_url(client, format: :json)
end
