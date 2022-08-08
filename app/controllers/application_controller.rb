# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]

  private
  def after_sign_in_path_for(resource_or_scope)     
    dashboard_index_path   
  end
end
