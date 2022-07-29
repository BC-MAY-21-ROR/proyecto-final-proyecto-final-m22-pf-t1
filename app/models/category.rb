# frozen_string_literal: true

# Create a category for Products
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
end
