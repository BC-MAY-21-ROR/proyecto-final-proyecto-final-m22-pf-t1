# frozen_string_literal: true

class ReportsController < ApplicationController
  load_and_authorize_resource :user

  def index; end

  def daily
    @sub = 0
    @report_daily = Invoice.daily_invoice
    @report_daily.each do |i|
      @sub += i.amount
    end
    @sub
    report_box(@report_daily)
  end

  def monthly
    @sub = 0
    @report_monthly = Invoice.monthly_invoice
    @report_monthly.each do |i|
      @sub += i.amount
    end
    @sub
    report_box(@report_monthly)
  end

  def weekly
    @list = between_dates(search_params[:start_date], search_params[:end_date]) if search_params.present?
    #report_box(@list) if @list.present?
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
    Invoice.where('date BETWEEN ? AND ?', start, endd).order(amount: :desc)
  end

  def calculate_comission(start, endd)
    @final_list = {}
    @commissions = between_dates(start, endd)
    @commissions.each do |invoice|
      calculate_earn(invoice.id)
      @final_list[invoice.id] = @data
    end
    calculate_total_comision(@final_list)
  end

  def calculate_total_comision(list_comissions)
    @key_list = {}

    list_comissions.each do |_invoice, data|
      data.each do |key, value|
        @key_list[key] = if @key_list.key?(key)
                           @key_list[key] + value[1]
                         else
                           value[1]
                         end
      end
    end
  end

  def report_box(report_invoices)
     @payment_card=0
     @payment_cash=0
      report_invoices.each do |invoice|
        cash= Payment.where(invoice_id: invoice.id).cash_payments
        card = Payment.where(invoice_id: invoice.id).card_payments

        if !cash.nil?
            @payment_cash += cash
        end
        if !card.nil?
          @payment_card += card
        end
        
      end
  end
  private

  def search_params
    params.permit(:start_date, :end_date, :commit)
  end
end
