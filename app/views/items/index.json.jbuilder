json.array!(@items) do |item|
  json.extract! item, :id, :name, :amount
  json.url item_url(item, format: :json)
end
