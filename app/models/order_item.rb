# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :stylist

  def to_s
    adjustment
  end

  def to_i
    quantity
  end
end
