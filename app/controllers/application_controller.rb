class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_attributes = %i[name nickname email avatar]
    edit_attributes = %i[bio facebook instagram twitter theme]
    edit_options = [sign_up_attributes, edit_attributes]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: edit_options)
  end
end
