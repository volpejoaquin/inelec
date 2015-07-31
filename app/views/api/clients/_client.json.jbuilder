json.extract! client, :id, :name, :address, :city, :category, :postal_code, :phone, :email, :cuit, :address_ext
json.contact_people do |contact_people|
  contact_people.array! client.contact_people do |contact_person|
    json.extract! contact_person, :id, :name, :lastname
  end
end