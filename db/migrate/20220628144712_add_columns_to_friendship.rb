class AddColumnsToFriendship < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :friend_a_id, :integer
    add_column :friendships, :friend_b_id, :integer
  end
end
