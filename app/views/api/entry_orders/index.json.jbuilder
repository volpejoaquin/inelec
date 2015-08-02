json.array!(@entry_orders) do |order|
  json.extract! order, :id, :number, :datetime, :comments
end
