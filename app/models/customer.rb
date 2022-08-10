# frozen_string_literal: true

# Create a customer for business
class Customer < ApplicationRecord
  belongs_to :business
  has_many :invoices

  scope :with_name_or_dni, lambda { |customer_search|
                             where('lower(full_name) LIKE ? OR dni LIKE ?', "%#{customer_search.downcase}%",
                                   "%#{customer_search}%")
                           }
end
