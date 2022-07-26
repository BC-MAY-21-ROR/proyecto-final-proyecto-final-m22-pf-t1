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

    respond_to do |format|
      if @deduction.save
        format.html { redirect_to deduction_url(@deduction), notice: 'Deduction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deduction.update(deduction_params)
        format.html { redirect_to deduction_url(@deduction), notice: 'Deduction was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deduction.destroy

    respond_to do |format|
      format.html { redirect_to deductions_url, notice: 'Deduction was successfully destroyed.' }
    end
  end

  private

  def set_deduction
    @deduction = Deduction.find(params[:id])
  end

  def deduction_params
    params.require(:deduction).permit(:date, :amount, :stylist_id, :description, :status)
  end
end
