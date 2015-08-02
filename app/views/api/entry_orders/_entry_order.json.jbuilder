json.extract! entry_order, :id, :number, :datetime, :comments
json.transformers do |transformers|
  transformers.array! entry_order.transformers, :id, :mark, :power, :number, :diagnostic, :comments
end