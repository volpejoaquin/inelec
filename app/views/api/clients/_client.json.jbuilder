json.extract! client, :id, :name, :address, :phone, :email, :website, :number_of_appointments, :observations, :pending_woopa, :pending_client, :next_visit, :status_id, :client_type_id, :status, :last_visit, :number_of_visits
json.has_the_system client.has_the_system?
json.contact_people do |contacts|
  contacts.array! client.contact_people, :id, :name
end
json.members do |members|
  members.array! client.organizations do |org|
    json.extract! org, :has_the_system
    json.extract! org.member, :id, :name
  end
end
json.companies do |companies|
  companies.array! client.inverse_organizations do |org|
    json.extract! org, :has_the_system
    json.extract! org.company, :id, :name
  end
end
json.client_type client.client_type, :id, :name
json.has_observations client.observations.present?
json.has_pending_woopa client.pending_woopa.present?
json.has_pending_client client.pending_client.present?