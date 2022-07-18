# frozen_string_literal: true

# Create a Business for user
class Business < ApplicationRecord
  belongs_to :user
  has_many :stylists, dependent: :destroy

  validates :name, presence: true
end
