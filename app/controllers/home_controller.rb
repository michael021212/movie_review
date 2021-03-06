class HomeController < ApplicationController
  include Common
  before_action :authenticate_user!, only: %i[ranking timeline]
  before_action :set_tmdb_key, only: %i[ranking timeline]

  def timeline
    if user_signed_in?
      @timeline_reviews = current_user.timeline.page(params[:page]).reverse_order
    end
  end

  def about
  end

  def ranking
    if user_signed_in?
      @good_ranking_reviews = Review.good_ranks
      @bad_ranking_reviews = Review.bad_ranks
      @follower_ranking_users = User.follower_ranks
      @count_ranking_reviews = Review.count_ranks # review_countというキーもコンソール上では見えないけど入っている
    end
  end

  def new_guest
    user = User.find_or_create_by!(name: 'souta', email: 'souta@example.com', birthday: '1960-01-01', sex: '男', intro: 'soutaです。よろしくお願いします。') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
