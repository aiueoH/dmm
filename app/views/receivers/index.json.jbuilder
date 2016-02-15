json.array!(@receivers) do |receiver|
  json.extract! receiver, :id, :name, :contact, :phone, :comment
  json.url receiver_url(receiver, format: :json)
end
