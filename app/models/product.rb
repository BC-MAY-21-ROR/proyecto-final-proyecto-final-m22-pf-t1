# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true
  validates :reference, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
end
