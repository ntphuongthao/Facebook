module ApplicationHelper
  def check_friendship(friend_a, friend_b)
    Friendship.where(friend_a_id: friend_a.id, friend_b_id: friend_b.id).length > 0
  end
end

