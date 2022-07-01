class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated successfully!"
      redirect_to current_user
    else
      flash[:notice] = "Your post has not been updated successfully!"
      render "edit"
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to current_user, notice: 'Post was successfully created!'
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to current_user, notice: 'Post was successfully destroyed!'
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :author_id)
  end
end
