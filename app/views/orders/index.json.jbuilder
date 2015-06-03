json.array!(@orders) do |order|
  json.extract! order, :id, :name, :number
  json.url order_url(order, format: :json)
end
