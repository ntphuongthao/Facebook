class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend_request, except: :create

  def create
    @friend_request = FriendRequest.create(sender_id: current_user.id, recipient_id: params[:recipient_id])
    if @friend_request.save
      redirect_to search_path(params: {query: params[:query]}), notice: "Friend request has been successfully sent!"
    else
      redirect_to search_path(params: {query: params[:query]}), alert: "Friend request has not been successfully sent!"
    end
  end

  def confirm
    if @friend_request.recipient == current_user
      Friendship.create(friend_a: @friend_request.sender, friend_b: @friend_request.recipient)
      Friendship.create(friend_b: @friend_request.sender, friend_a: @friend_request.recipient)
      @friend_request.destroy
      redirect_to friends_requests_path, notice: "Friend request has been successfully confirmed!"
    else
      redirect_to friends_requests_path, alert: 'You are not allowed to accept this request!'
    end
  end

  def delete
    if @friend_request.recipient == current_user
      @friend_request.destroy
      redirect_to friends_requests_path, notice: "Friend request has been successfully deleted!"
    else
      redirect_to friends_requests_path, alert: 'You are not allowed to delete this request!'
    end
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
