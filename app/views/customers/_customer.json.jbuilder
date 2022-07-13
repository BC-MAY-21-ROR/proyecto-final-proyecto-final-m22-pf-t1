json.extract! customer, :id, :dni, :full_name, :telephone, :birthday, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
