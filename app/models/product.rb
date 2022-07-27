# frozen_string_literal: true

# Create products for business
class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true
  validates :reference, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cannon, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
