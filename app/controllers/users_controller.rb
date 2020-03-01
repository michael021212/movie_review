class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_correct_user, only: [:edit]
  before_action :set_tmdb_key, only: [:show]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
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
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
    render :index
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "このページにはアクセスできません"
      redirect_back(fallback_location: user_path(current_user))
    else
      render :edit
    end
  end

  def user_params
      params.require(:user).permit(:name, :image, :email, :birthday, :sex, :intro)
  end

  def search_params
    params.require(:q).permit(:name_cont, :intro_cont, :sex_eq, :birthday_gteq, :birthday_lteq, :birthday_to_age_gteq, :birthday_to_age_lteq)
  end

  def set_tmdb_key
    gon.TMDb_KEY = ENV['TMDb_KEY']
  end
end
