# frozen_string_literal: true

# Create Logic for Products
class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url, notice: 'El producto ha sido creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, notice: 'El producto se ha actualizado con éxito.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'El producto fue eliminado con éxito.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:reference, :name, :description, :price, :actived, :cannon, :category_id)
  end
end
