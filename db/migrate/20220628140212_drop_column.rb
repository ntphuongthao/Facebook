class DropColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :friend_requests, :requester_id
  end
end
