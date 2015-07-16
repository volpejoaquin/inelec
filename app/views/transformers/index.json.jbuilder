json.array!(@transformers) do |transformer|
  json.extract! transformer, :id, :mark, :power, :number, :record_id, :diagnostic, :comments, :entry_order_id, :exit_order_id
  json.url transformer_url(transformer, format: :json)
end
