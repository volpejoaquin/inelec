Fabricator(:client) do
  name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  category_id { Faker::Number.between(0, 2) }
  postal_code { Faker::Address.zip_code }
  phone { Faker::PhoneNumber.cell_phone }
  email { Faker::Internet.email }
  cuit { Faker::Company.duns_number }

  after_build do |client|
    2.times.map { Fabricate(:contact_person, :client => client) }
    4.times.map { Fabricate(:entry_order, :client => client) }
  end
end