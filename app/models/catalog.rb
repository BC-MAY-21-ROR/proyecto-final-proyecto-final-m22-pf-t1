class Catalog < ApplicationRecord
  validates :name, :price, presence: true
  validates :reference, uniqueness: true
end
