class RemoveUserIdInLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user_id
  end
end
