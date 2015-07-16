json.array!(@diagnostics) do |diagnostic|
  json.extract! diagnostic, :id, :date, :comments, :transformer_id
  json.url diagnostic_url(diagnostic, format: :json)
end
