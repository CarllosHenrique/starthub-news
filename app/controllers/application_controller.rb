class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_attributes = [:name, :nickname, :email, :avatar]
    edit_attributes = [sign_up_attributes, :bio, :facebook, :instagram, :twitter]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: edit_attributes)
  end
end
