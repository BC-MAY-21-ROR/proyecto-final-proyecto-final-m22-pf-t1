# frozen_string_literal: true

# Create Logic for Stylists
class StylistsController < ApplicationController
  before_action :set_stylist, only: %i[show edit update destroy]

  def index
    @stylists = Stylist.all
  end

  def show; end

  def new
    @stylist = Stylist.new
  end

  def edit; end

  def create
    @stylist = Stylist.new(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.html { redirect_to stylist_url(@stylist), notice: 'Stylist was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.html { redirect_to stylist_url(@stylist), notice: 'Stylist was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stylist.destroy

    respond_to do |format|
      format.html { redirect_to stylists_url, notice: 'Stylist was successfully destroyed.' }
    end
  end

  private

  def set_stylist
    @stylist = Stylist.find(params[:id])
  end

  def stylist_params
    params.require(:stylist).permit(:dni, :name, :actived, :role, :business_id)
  end
end
