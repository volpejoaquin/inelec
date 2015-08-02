Fabricator(:contact_person) do
  name { Faker::Company.name }
  phone { Faker::PhoneNumber.cell_phone }
  email { Faker::Internet.email }
  position { Faker::Company.bs }
  client
end