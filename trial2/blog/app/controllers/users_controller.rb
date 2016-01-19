class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end
end