# frozen_string_literal: true

# Create a Invoice for customer
class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :payments, dependent: :destroy
  
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :payments

  scope :daily_invoice, -> { where(date: Time.zone.today.all_day) }
  scope :monthly_invoice, -> { where(date: Time.zone.today.all_month) }
  #scope :between_dates, -> { where('date BETWEEN ? AND ?', start_date.today.all_day, end_date: end_date.today.all_day) }
end
