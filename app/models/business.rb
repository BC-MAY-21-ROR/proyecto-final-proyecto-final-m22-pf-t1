# frozen_string_literal: true

# Create a Business for user
class Business < ApplicationRecord
  belongs_to :user #default: -> { current_user.id }
  has_many :stylists, dependent: :destroy

  validates :name, presence: true
end
