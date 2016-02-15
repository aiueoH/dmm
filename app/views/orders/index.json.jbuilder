json.array!(@orders) do |order|
  json.extract! order, :id, :comment, :receiver_id, :item_id
  json.url order_url(order, format: :json)
end
