# frozen_string_literal: true

json.extract! invoice, :id, :date, :amount, :customer_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
