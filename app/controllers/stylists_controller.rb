# frozen_string_literal: true

# Create Logic for Stylists
class StylistsController < ApplicationController
  load_and_authorize_resource
  before_action :set_stylist, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @stylists = Stylist.where(business_id: current_user.id)
    else
      redirect_to dashboard_index_path
    end
  end

  def show; end

  def new
    @stylist = Stylist.new
  end

  def desactivate
    @stylists = Stylist.with_name_or_dni(params[:_query]) if params[:_query].present?

    Stylist.find(params[:stylist_id]).toggle(:actived).save if params[:stylist_id].present?
  end

  def edit; end

  def create
    @stylist = Stylist.new(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.html { redirect_to stylists_url, notice: 'El estilista fue creado con éxito.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.html { redirect_to stylists_url, notice: 'El estilista se ha actualizado con éxito.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stylist.destroy

    respond_to do |format|
      format.html { redirect_to stylists_url, notice: 'El estilista fue eliminado con éxito..' }
    end
  end

  private

  def set_stylist
    @stylist = Stylist.find(params[:id])
  end

  def stylist_params
    params.require(:stylist).permit(:dni, :name, :telephone, :actived, :role, :business_id)
  end

  def search_params
    params.require(:stylist).permit(:_query)
  end

  def desactivate_params
    params.require(:stylist).permit(:id, :_query)
  end
end
