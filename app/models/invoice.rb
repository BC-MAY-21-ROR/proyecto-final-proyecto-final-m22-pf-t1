# frozen_string_literal: true

# Create a Invoice for customer
class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :payments, dependent: :destroy
  
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :payments

  scope :daily_invoice, -> { where(date: Time.zone.today.all_day).order(amount: :desc) }
  scope :monthly_invoice, -> { where(date: Time.zone.today.all_month).order(amount: :desc) }
  scope :pending_invoice, -> { where(status: "pending")}
  scope :paid_invoice, -> { where(status: "paid") }
  scope :partial_invoice, -> { where(status: "partial") }
  scope :not_paid_invoice, -> { where.not(status: "paid") }
  
  
end
