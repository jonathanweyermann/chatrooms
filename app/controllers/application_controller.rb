class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cookie
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_cookie
    if current_customer
      cookies[:current_customer] = { value: current_customer.id, expires: 1.hour.from_now }
    end
  end


  def after_sign_in_path_for(resource)
  stored_location_for(resource) ||
    if resource.is_a?(Customer)
      root_path
    elsif resource.is_a?(Operator)
      operators_helpchats_path
    else
      super
    end
  end
end
