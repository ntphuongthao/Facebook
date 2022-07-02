class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :update, :edit]
  def new
    @comment = Comment.new
  end

  def create 
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to User.find(params[:comment][:friend_id].to_i), notice: 'Comment was successfully created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @author = current_post_author
    if @comment.update(comment_params)
      redirect_to @author, notice: 'Comment was successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    @author = current_post_author
    redirect_to @author, notice: 'Comment was successfully deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :commentable_id, :commentable_type)
  end

  def current_post_author
    id = @comment.commentable_id
    @author = @comment.commentable_type.constantize.find(id).author
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
