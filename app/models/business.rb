# frozen_string_literal: true

# Create a Business for user
class Business < ApplicationRecord
  belongs_to :user, inverse_of: :business
  has_many :stylists, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true, uniqueness: { message: 'The business has a owner' }
end
