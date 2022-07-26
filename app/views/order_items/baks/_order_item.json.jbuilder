# frozen_string_literal: true

json.extract! order_item, :id, :quantity, :adjustment, :stylist_id, :invoice_id, :product_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
