# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActionController::RoutingError, with: -> { content_not_found }

  include ApplicationHelper
  include OrderHelper
  include Authorizable

  def content_not_found
    render file: Rails.root.join('public/404'), layout: false, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name display_name role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name display_name])
  end
end
