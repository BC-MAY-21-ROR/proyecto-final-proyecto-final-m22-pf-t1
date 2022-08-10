# frozen_string_literal: true

# Create a Stylist for business
class Stylist < ApplicationRecord
  belongs_to :business
  has_many :deductions, dependent: :destroy

  validates :dni, :name, :role, presence: true
  validates :dni, uniqueness: true

  scope :with_name_or_dni, lambda { |search|
                             where('lower(name) LIKE ? OR dni LIKE ?', "%#{search.downcase}%",
                                   "%#{search}%")
                           }
  scope :activated, -> { where('actived=true') }
end
