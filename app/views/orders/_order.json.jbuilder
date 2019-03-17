json.extract! order, :id, :title, :description, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
