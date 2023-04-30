json.extract! list_item, :id, :bill_id, :quantity, :amount, :name, :created_at, :updated_at
json.url list_item_url(list_item, format: :json)
