# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_if_user_signed_in
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_if_user_signed_in
    redirect_to new_user_session_path unless user_signed_in? || (request.path == new_user_session_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[postal_code address self_introduction])
  end
end
