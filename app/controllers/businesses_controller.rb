# frozen_string_literal: true

# Create Logic for Business
class BusinessesController < ApplicationController
  load_and_authorize_resource
  before_action :set_business, only: %i[show edit update destroy]

  def index
    @businesses = current_user&.business
  end

  def show; end

  def new
    if @businesses.nil?
      render :index
    else
      @business = Business.new
    end
  end

  def edit; end

  def create
    @business = current_user.create_business(business_params)
    if @business.save
      redirect_to businesses_path, notice: 'Su negocio ha sido creado'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @business.update(business_params)
      redirect_to businesses_path, notice: 'Su negocio se ha actualizado'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @business.destroy
    # redirect_to businesses_url, notice: 'Business was successfully destroyed.'
  end

  private

  def set_business
    @business = current_user.business
  end

  def business_params
    params.require(:business).permit(:name, :nit, :country, :city, :telephone, :email, :user_id)
  end
end
