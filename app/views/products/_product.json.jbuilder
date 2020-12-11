json.extract! product, :id, :title, :description, :price, :image_url, :category, :brand, :created_at, :updated_at
json.url product_url(product, format: :json)
