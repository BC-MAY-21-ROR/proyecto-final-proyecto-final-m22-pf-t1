# frozen_string_literal: true

# Create a customer for business
class Customer < ApplicationRecord
  belongs_to :business

  def to_s
    full_name
  end
end
