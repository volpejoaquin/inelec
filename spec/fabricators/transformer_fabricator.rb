Fabricator(:transformer) do
  mark { Faker::Company.name }
  power { Faker::Number.number(3) }
  number { Faker::Number.number(10) }
  diagnostic { Faker::Lorem.word }
  comments { Faker::Lorem.paragraph }

  entry_order
end