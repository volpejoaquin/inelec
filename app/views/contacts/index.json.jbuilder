json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :lastname, :phone, :email, :charge, :client_id
  json.url contact_url(contact, format: :json)
end
