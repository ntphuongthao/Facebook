class UserMailer < ApplicationMailer
  def new_account
    @user = params[:user]
    mail(to: @user.email,
         subject: "Your new account has been created successfully!"
    )
  end
end
