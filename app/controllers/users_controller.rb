class UsersController < ApplicationController
  before_action :authenticate_user!

  def friends
    @user = current_user
    @friends = @user.friendships
  end

  def show 
    @user = User.find(params[:id])
  end

  def friend_requests
    @invitations = current_user.friend_invitations
  end

  def find_friends
  end
end
