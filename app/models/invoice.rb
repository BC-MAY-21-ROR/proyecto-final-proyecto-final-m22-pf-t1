# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :customer

  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, reject_if: proc { |attr| attr['stylist_id'].blank? }, allow_destroy: true
end
