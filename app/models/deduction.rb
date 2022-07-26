# frozen_string_literal: true

class Deduction < ApplicationRecord
  belongs_to :stylist

  validates :date, :amount, :status, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { maximum: 200 }
end
