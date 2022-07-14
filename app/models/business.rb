# frozen_string_literal: true

class Business < ApplicationRecord
  # Create a business for user admin
  belongs_to :user
  validates :name, presence: true
end
