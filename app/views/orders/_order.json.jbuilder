json.extract! order, :id, :code, :product_price, :shipping_us, :product_weight, :shiperrbox_buy, :home_service, :link, :total, :status, :category_id, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
