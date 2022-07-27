# frozen_string_literal: true

# Create a Invoice for customer
class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items
end
