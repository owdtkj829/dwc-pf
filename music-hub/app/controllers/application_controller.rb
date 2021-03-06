class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #sign_in後のredirect先をマイページへ。
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  #sign_out後のredirect先変更する。rootパスへ。
  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
