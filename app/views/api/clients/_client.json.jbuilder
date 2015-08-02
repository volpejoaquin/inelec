json.extract! client, :id, :name, :address, :city, :category, :postal_code, :phone, :email, :cuit, :address_ext
json.contact_people do |contacts|
  contacts.array! client.contact_people, :id, :name, :email, :phone, :position, :decision_maker
end