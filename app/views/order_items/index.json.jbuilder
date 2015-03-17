json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :order_id, :user_id, :item_name, :item_amount, :item_quantity
  json.url order_item_url(order_item, format: :json)
end
