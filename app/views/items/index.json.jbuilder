json.array!(@items) do |item|
  json.extract! item, :id, :name, :amount, :safety_stock
  json.url item_url(item, format: :json)
end
