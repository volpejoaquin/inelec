json.array!(@contact_people) do |contact|
  json.extract! contact, :id, :name, :email, :phone, :position, :decision_maker
end
