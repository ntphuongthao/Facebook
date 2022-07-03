class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    @post = @like.likable_type.constantize.find(@like.likable_id)
    redirect_to @post.author
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.likable_type.constantize.find(@like.likable_id)
    @like.destroy
    redirect_to @post.author
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likable_id, :likable_type)
  end
end