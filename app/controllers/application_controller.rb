class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def home
    render 'shared/about'
  end
  
  private

  def send_new_account_email
    UserMailer.with(user: @user).new_account.deliver_now
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:username, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
     user_params.permit(:username, :email, :password, :password_confirmation)
    end
  end
end
