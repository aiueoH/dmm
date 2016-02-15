json.array!(@orders) do |order|
  json.extract! order, :id, :comment, :receiver_id, :item_id, :amount
  json.url order_url(order, format: :json)
end
