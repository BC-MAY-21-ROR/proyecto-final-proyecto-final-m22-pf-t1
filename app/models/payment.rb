# frozen_string_literal: true

# Create a Payments for invoice
class Payment < ApplicationRecord
  belongs_to :invoice
end
