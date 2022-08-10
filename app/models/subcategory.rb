# frozen_string_literal: true

# Create a Subcategory for categories
class Subcategory < ApplicationRecord
 belongs_to :category
end
