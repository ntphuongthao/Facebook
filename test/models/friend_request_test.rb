# == Schema Information
#
# Table name: friend_requests
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  sender_id    :integer
#  recipient_id :integer
#
require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
