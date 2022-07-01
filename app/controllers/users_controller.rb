class UsersController < ApplicationController
  before_action :authenticate_user!

  def friends
    @user = current_user
    @friends = []
    @user.friendships.each do |friendship| 
      @friends << User.find(friendship.friend_b_id)
    end
  end

  def show 
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def friend_requests
    @invitations = current_user.friend_invitations
  end

  def find_friends
  end
end
