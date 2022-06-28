class Users::RegistrationsController < Devise::RegistrationsController
  after_action :send_new_account_email, only: :create, if: -> { @user.persisted? }
end