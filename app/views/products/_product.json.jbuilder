json.extract! product, :id, :price_cents, :price, :cost_cents, :cost, :total_cents, :total, :created_at, :updated_at
json.url product_url(product, format: :json)
