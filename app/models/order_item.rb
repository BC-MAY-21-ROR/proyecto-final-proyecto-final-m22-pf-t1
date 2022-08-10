# frozen_string_literal: true

# Create a OrderItem for invoice
class OrderItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :stylist
end
