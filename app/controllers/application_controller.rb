class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  #protect_from_forgery prepend: true
  #protect_from_forgery prepend: true
  #protect_from_forgery prepend: true, with: :exception
  #skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end
end
