class ApplicationController < ActionController::Base
# sign_up時のnameの使用を許可
  before_action :configure_permitted_parameters,  if: :devise_controller?

# ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource_or_scope)
	stored_location_for(resource_or_scope) || user_path(resource)
  end
# ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

# sign_up時のnameの使用を許可
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
