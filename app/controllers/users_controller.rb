class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).reverse_order
    @good_reviews = @user.good_reviews.page(params[:page]).reverse_order
    @bad_reviews = @user.bad_reviews.page(params[:page]).reverse_order
    @user_interests = Interest.where(user_id: current_user.id)

    @user_followings = @user.followings.page(params[:page])
    @user_followers = @user.followers.page(params[:page])

    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)

    @interests = @user.interests.page(params[:page])
    @current_user_reviews = current_user.reviews
    @score_reviews = Review.select(:movie_id, :total_score)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

private
  def user_params
      params.require(:user).permit(:name, :image, :email, :birthday, :sex, :intro)
  end
end
