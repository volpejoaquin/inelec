Fabricator(:entry_order) do
  number { Faker::Number.number(10) }
  datetime { Faker::Time.between(DateTime.now, DateTime.now + 120) }
  comments { Faker::Lorem.sentence }
  client

  after_build do |entry_order|
    Random.rand(8).times.map { Fabricate(:transformer, :entry_order => entry_order) }
  end
end