class AddCommentableColumnToCommentsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :commentable, polymorphic: true
  end
end
