# frozen_string_literal: true

# Create a customer for business
class Customer < ApplicationRecord
  belongs_to :business

  scope :with_name_or_dni, lambda { |_search|
                             where('lower(full_name) LIKE ? OR dni LIKE ?', "%#{_search.downcase}%",
                                   "%#{_search}%")
                           }
end
