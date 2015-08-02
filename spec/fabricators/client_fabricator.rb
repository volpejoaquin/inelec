Fabricator(:client) do
  name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  category_id { Faker::Number.between(0, 2) }
  postal_code { Faker::Address.zip_code }
  phone { Faker::PhoneNumber.cell_phone }
  email { Faker::Internet.email }
  cuit { Faker::Company.duns_number }
end