class UsersController < ApplicationController
  before_action :authenticate_user!

  def show 
    @user = User.find(params[:id])
  end

  def friend_requests
    @invitations = current_user.friend_invitations
  end

end
