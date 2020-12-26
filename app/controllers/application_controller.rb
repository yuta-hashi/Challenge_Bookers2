class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
Refile.secret_key = '6d82cbcf4231b9c7d0ce35a607e38e7599f92f512cc710ef36e163c8d224006a9a3abb6c09169c9facd08bab8df52de238265420529014cdac75637e4a483d83'

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

end
