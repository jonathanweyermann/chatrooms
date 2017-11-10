class Operators::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cookie
  protected

  layout 'operators/application'

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_cookie
    if current_operator
      cookies[:current_operator] = { value: current_operator.id, expires: 1.hour.from_now }
    end
  end
end
