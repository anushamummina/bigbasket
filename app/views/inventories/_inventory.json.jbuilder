json.extract! inventory, :id, :name, :quantity, :inventory_amount, :user_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)