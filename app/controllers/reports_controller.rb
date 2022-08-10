# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @sales = invoice_daily_report
    @sales_monthly = invoices_monthly_report
    calculate_earn(80)
  
  end

  def invoice_daily_report
    @sub = 0
    @report_daily = Invoice.daily_invoice
    @report_daily.each do |i|
      @sub = i.amount + @sub
    end
    @sub
  end

  def invoices_monthly_report
    @sub = 0
    @report_daily = Invoice.daily_invoice
    @report_daily.each do |i|
      @sub = i.amount + @sub
    end
    @sub
  end

  def stylists_on_invoice(inv_id)
   @stylists_on= OrderItem.select('DISTINCT stylist_id').where('invoice_id = ?',inv_id)
  end

  def items_in_invoice(inv_id,sty_id)
    @items_by_stylist=OrderItem.where(stylist_id: sty_id).where(invoice_id: inv_id)
  end


  def calculate_earn(inv_id)
    @datas=Hash.new
    stylists_on_invoice(inv_id)
    @stylists_on.each do |stylist|
    subt=0
    gain=0
      items_in_invoice(inv_id, stylist.stylist_id)
        @items_by_stylist.each do |item|
          gain += ((item.product.price * item.quantity)+item.adjustment)*(1 - item.product.cannon)
           subt += item.product.price
        end
       @datas[stylist.stylist.name]= [subt, gain]
    end
  end
end
