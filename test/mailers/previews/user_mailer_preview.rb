# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_account
    @user = User.last
    UserMailer.with(user: @user).new_account.deliver_now
  end
end
