# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :business

  def to_s
    full_name
  end
end
