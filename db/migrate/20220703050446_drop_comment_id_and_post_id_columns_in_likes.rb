class DropCommentIdAndPostIdColumnsInLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :comment_id
    remove_column :likes, :post_id
  end
end
