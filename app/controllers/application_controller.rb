class ApplicationController < ActionController::Base
  def home
    render 'shared/about'
  end
  
  private

  def send_new_account_email
    UserMailer.with(user: @user).new_account.deliver_now
  end
end
