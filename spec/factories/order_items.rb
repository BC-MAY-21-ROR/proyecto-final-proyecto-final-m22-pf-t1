# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    invoice { nil }
    product { nil }
    quantity { 1 }
    adjustment { 1 }
    stylist { nil }
  end
end
