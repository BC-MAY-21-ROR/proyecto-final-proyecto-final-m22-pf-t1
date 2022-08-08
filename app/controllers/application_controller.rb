# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]

  private

  def after_sign_in_path_for(_resource_or_scope)
    dashboard_index_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
