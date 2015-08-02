Fabricator(:entry_order) do
  number { Faker::Number.number(10) }
  datetime { Faker::Time.between(DateTime.now, DateTime.now + 120) }
  comments { Faker::Lorem.sentence }
  client
end