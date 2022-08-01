# frozen_string_literal: true

# calculate total amount
class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[show edit update destroy]
  before_action :get_invoice
  before_action :get_stylists

  # GET /order_items or /order_items.json
  def index
    @order_items = @invoice.order_items
    get_sub_total
  end

  # GET /order_items/1 or /order_items/1.json
  def show; end

  # GET /order_items/new
  def new
    @order_item = @invoice.order_items.build
    @product_data = search_product(params[:_query]) if params[:_query].present?
  end

  # GET /order_items/1/edit
  def edit; end

  # POST /order_items or /order_items.json
  def create
    @order_item = @invoice.order_items.build(order_item_params)

    OrderItem.new(order_item_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to invoice_order_items_path(@invoice), notice: 'Order item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to invoice_order_items_path(@invoice), notice: 'Order item was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
    end
  end

  def get_sub_total
    @sub_total = 0
    @order_items.each do |item|
      @sub_total += ((item.quantity * item.product.price) + item.adjustment)
    end
    @invoice.update(amount: @sub_total) if @sub_total.positive?
  end

  def search_product(search)
    Product.select(:id, :reference, :name, :description).where('lower(reference) LIKE ? OR lower(name) like ?',
                                                               "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def get_stylists
    @stylists = Stylist.select(:id, :name).all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def get_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_item_params
    params.require(:order_item).permit(:quantity, :adjustment, :stylist_id, :invoice_id, :product_id)
  end

  def search_product_params
    params.require(:invoice).permit(:_query)
  end
end
