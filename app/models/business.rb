# frozen_string_literal: true

class Business < ApplicationRecord
  validates :name, presence: true
end
