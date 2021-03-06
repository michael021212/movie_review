class ReviewsController < ApplicationController
  include Common
  before_action :tag_cloud, only: %i[index edit new search]
  before_action :authenticate_user!, except: %i[index tag_cloud]
  before_action :ensure_correct_user, only: [:edit]
  before_action :set_tmdb_key, only: %i[index show new search]

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).reverse_order
    @genres = GENRES
    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)
  end

  def show
    @q = Review.ransack(params[:q])
    @review = Review.find(params[:id])

    gon.movie_id = Review.find(params[:id]).movie_id
    @current_user_interests_movie_id = current_user.interests.pluck(:movie_id)

    @reviews = Review.where(movie_id: @review.movie_id)
    @interests = Interest.all.where(movie_id: @review.movie_id)
    @current_user_reviews_movie_id = current_user.reviews.find_by(movie_id: @review.movie_id)

    elements = %i[story_score direction_score acting_score visual_score music_score] # 各スコアを配列にする
    @avg_score = elements.map { |element| @review[element] }
  end

  def new
    gon.movie_id = params[:movie_id]
    @review = Review.new(movie_id: params[:movie_id], title: params[:title], poster_path: params[:poster_path])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review), notice: 'レビューを投稿しました'
    else
      # renderだとパラメータが消えてしまうので、バリデーションメッセージをフラッシュに入れてredirectし、viewで表示させる
      flash[:review_alert] = @review.errors.full_messages.to_s.gsub!(/"/, '').gsub(/\]/, '').gsub(/\[/, '')
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to user_path(current_user), notice: "レビューを更新しました"
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to request.referer, alert: "レビューを削除しました"
  end

  def search
    @q = Review.search(search_params)
    @reviews = @q.result(distinct: true).page(params[:page]).reverse_order
    @genres = GENRES
    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)
    render :index
  end

  private

  def ensure_correct_user
    set_tmdb_key
    @review = Review.find(params[:id])
    gon.movie_id = @review.movie_id
    if @review.user != current_user
      flash[:notice] = "このページにはアクセスできません"
      redirect_back(fallback_location: user_path(current_user))
    else
      render :edit
    end
  end

  def tag_cloud
    @tags = tags_desc
  end

  def review_params
    params.require(:review).permit(:movie_id, :title, :poster_path, :user_id, :total_score, :story_score, :direction_score, :acting_score, :visual_score, :music_score, :body, :tag_list, :spoiler)
  end

  def search_params
    params.require(:q).permit(:total_score_gteq, :story_score_gteq, :direction_score_gteq, :acting_score_gteq, :visual_score_gteq, :music_score_gteq, :body_cont)
  end
end
