# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :get_current_business, except: [:index]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def get_current_business
    if user_signed_in? 
      @business=Business.find_by(user_id: current_user.id)
    end
  end

  private

  def after_sign_in_path_for(_resource)
    dashboard_index_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
