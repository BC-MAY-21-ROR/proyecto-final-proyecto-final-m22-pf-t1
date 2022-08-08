# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @sales = invoice_daily_report
    @sales_monthly = invoices_monthly_report
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
end
