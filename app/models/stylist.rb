# frozen_string_literal: true

class Stylist < ApplicationRecord
  validates :dni, :name, :actived, :role, presence: true
  validates :dni, uniqueness: true
end
