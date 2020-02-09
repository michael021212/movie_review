class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @good_reviews = @user.good_reviews
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

private
  def user_params
      params.require(:user).permit(:name, :image, :email, :birthday, :sex, :intro)
  end
end
