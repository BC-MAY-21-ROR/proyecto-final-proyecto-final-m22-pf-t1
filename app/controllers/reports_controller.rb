# frozen_string_literal: true

class ReportsController < ApplicationController
  load_and_authorize_resource :user
  def index
    @sales = daily_report
    @sales_monthly = invoices_monthly_report
    calculate_earn(80)
  end

  def daily
    @sub = 0
    @report_daily = Invoice.daily_invoice
    @report_daily.each do |i|
      @sub += i.amount
    end
    @sub
  end

  def monthly
    @sub = 0
    @report_monthly = Invoice.monthly_invoice
    @report_monthly.each do |i|
      @sub += i.amount
    end
    @sub
  end

  def weekly
    @list = between_dates(search_params[:start_date], search_params[:end_date]) if search_params.present?
  end

  def comissions
    calculate_comission(search_params[:start_date], search_params[:end_date]) if search_params.present?
  end

  def stylists_on_invoice(inv_id)
    @stylists_on = OrderItem.select('DISTINCT stylist_id').where(invoice_id: inv_id)
  end

  def items_in_invoice(inv_id, sty_id)
    @items_by_stylist = OrderItem.where(stylist_id: sty_id).where(invoice_id: inv_id)
  end

  def calculate_earn(inv_id)
    @data = {}
    stylists_on_invoice(inv_id)
    @stylists_on.each do |stylist|
      subt = 0
      gain = 0
      items_in_invoice(inv_id, stylist.stylist_id)
      @items_by_stylist.each do |item|
        if item.product.cannon.positive?
          gain += ((item.product.price * item.quantity) + item.adjustment) * (1 - item.product.cannon)
        end
        subt += item.product.price
      end
      @data[stylist.stylist.name] = [subt, gain] if gain.positive?
    end
  end

  def between_dates(start, endd)
    Invoice.where('date BETWEEN ? AND ?', start, endd)
  end

  def calculate_comission(start, endd)
    @final_list = {}
    @commissions = between_dates(start, endd)
    @commission.each do |invoice|
      calculate_earn(invoice.id)
      @final_list = @data
    end
  end

  private

  def search_params
    params.permit(:start_date, :end_date, :commit)
  end
end
