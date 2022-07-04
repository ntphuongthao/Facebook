class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    @like.save
    if @like.likable_type.constantize.to_s == 'Post'
      @post = @like.likable_type.constantize.find(@like.likable_id)
      redirect_to @post.author
    else
      @comment = @like.likable_type.constantize.find(@like.likable_id)
      @post = @comment.commentable_type.constantize.find(@comment.commentable_id)
      redirect_to @post.author
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.likable_type.constantize.to_s == 'Post'
      @post = @like.likable_type.constantize.find(@like.likable_id)
      @like.destroy
      redirect_to @post.author
    else
      @comment = @like.likable_type.constantize.find(@like.likable_id)
      @like.destroy
      @post = @comment.commentable_type.constantize.find(@comment.commentable_id)
      redirect_to @post.author
    end
  end

  private
  def like_params
    params.require(:like).permit(:likable_id, :likable_type, :user_id)
  end
end