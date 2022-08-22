# frozen_string_literal: true

# Create Logic for Payments
class PaymentsController < ApplicationController
  load_and_authorize_resource
  before_action :get_invoice
  before_action :set_invoice_status
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments or /payments.json
  def index
    @payments = @invoice.payments
  end

  # GET /payments/1 or /payments/1.json
  def show; end

  # GET /payments/new
  def new
    @payment = @invoice.payments.build
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    @payment = @invoice.payments.build(payment_params)
    Payment.new(payment_params)
    respond_to do |format|
   
      if @payment.save
        set_invoice_status
        format.html { redirect_to invoice_payments_path(@invoice), notice: 'El pago se ha realizado con éxito.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to invoice_payment_path(@invoice), notice: 'El pago se ha actualizado con éxito.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'El pago se ha eliminado con éxito.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = @invoice.payments.find(params[:id])
  end

  def get_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def set_invoice_status
    balance=@invoice.payments.sum(:value)
    amount=@invoice.amount
    if (amount - balance).positive?
      @invoice.update(status: "partial")
    else
      @invoice.update(status: "paid")
      @invoice.update(amount: balance)
    end
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:date, :invoice_id, :value, :kind, :note)
  end

  def invoice_params
    params.require(:invoice).permit(:invoice_id)
  end
end
