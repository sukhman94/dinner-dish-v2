# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ApplicationHelper
  include OrderHelper

  def content_not_found
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name display_name role])
  end
end
