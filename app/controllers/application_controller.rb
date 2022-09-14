class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :username, :password, :current_password) }
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end
end
