# frozen_string_literal: true

class Catalog < ApplicationRecord
  validates :name, :price, presence: true
  validates :reference, uniqueness: true
end
