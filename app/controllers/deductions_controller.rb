# frozen_string_literal: true

# Create Logic for Deductions
class DeductionsController < ApplicationController
  before_action :set_deduction, only: %i[show edit update destroy]

  def index
    @deductions = Deduction.all
  end

  def show; end

  def new
    @deduction = Deduction.new
  end

  def edit; end

  def create
    @deduction = Deduction.new(deduction_params)

    if @deduction.save
      redirect_to deductions_url, notice: 'Deduction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @deduction.update(deduction_params)
      redirect_to deductions_url, notice: 'Deduction was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deduction.destroy
    redirect_to deductions_url, notice: 'Deduction was successfully destroyed.'
  end

  private

  def set_deduction
    @deduction = Deduction.find(params[:id])
  end

  def deduction_params
    params.require(:deduction).permit(:date, :amount, :stylist_id, :description, :status)
  end
end
