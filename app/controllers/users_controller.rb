class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(user_params)
  end

  def update
    @user = User.find(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :education, :workplace, :birthday)
  end
end
