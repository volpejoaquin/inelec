json.array!(@contact_people) do |contact_person|
  json.extract! contact_person, :id, :name, :phone, :position, :email, :decision_maker, :client_id
  json.url contact_person_url(contact_person, format: :json)
end
