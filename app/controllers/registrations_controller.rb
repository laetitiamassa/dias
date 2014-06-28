class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end

  def after_sign_up_path_for(resource)
    edit_user_path(@user)
  end

  def create
    super
    UserMailer.welcome_email(@user).deliver unless @user.invalid?
  end
end
