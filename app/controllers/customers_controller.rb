# frozen_string_literal: true

# Create Logic for Customers
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers or /customers.json
  def index
    @business = current_user.business
    @customers = @business.customers
  end

  # GET /customers/1 or /customers/1.json
  def show; end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit; end

  # POST /customers or /customers.json
  def create
    @customer = current_user.business.customers.build(customer_params)

    if @customer.save
      redirect_to customer_url(@customer), notice: 'Customer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    if @customer.update(customer_params)
      redirect_to customer_url(@customer), notice: 'Customer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:dni, :full_name, :telephone, :birthday, :email, :business_id)
  end

  def search_params
    params.require(:customer).permit(:_query)
  end
end
