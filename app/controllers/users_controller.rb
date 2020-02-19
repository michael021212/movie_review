class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @good_reviews = @user.good_reviews
    @bad_reviews = @user.bad_reviews
    @user_interests = Interest.where(user_id: current_user.id)

    @user_followings = @user.followings
    @user_followers = @user.followers

    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def interest
    @user = User.find(params[:user_id])
    @interests = @user.interests
    @reviews = current_user.reviews
    @score_reviews = Review.select(:movie_id, :total_score)

    gon.TMDb_KEY = ENV['TMDb_KEY']
    # @interests = Interest.where(user_id: params[:user_id])
    gon.interests_movie_id = @interests.pluck(:movie_id)
    gon.reviews = Review.all
    gon.current_user_reviews = current_user.reviews
    gon.interests = Interest.where(user_id: current_user.id)
    gon.all_interests = Interest.all
    gon.user_id = params[:user_id]
    gon.total_scores = Review.select(:movie_id, :total_score)
  end

  def reviews
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    gon.movie_id = @reviews.pluck(:movie_id)
    gon.review_id = @reviews.pluck(:id)
  end

private
  def user_params
      params.require(:user).permit(:name, :image, :email, :birthday, :sex, :intro)
  end
end
