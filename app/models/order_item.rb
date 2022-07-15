# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :stylist
end
