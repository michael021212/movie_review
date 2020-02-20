class ReviewsController < ApplicationController
  before_action :tag_cloud, only: %i[index edit new]
  before_action :authenticate_user!, except: %i[index tag_cloud]

  def index
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @reviews = Review.all
    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)
    @genres = GENRES
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
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
    gon.TMDb_KEY = ENV['TMDb_KEY']
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
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @review = Review.find(params[:id])
    gon.movie_id = @review.movie_id
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

  def tag_cloud
    @tags = Review.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :title, :poster_path, :user_id, :total_score, :story_score, :direction_score,
      :acting_score, :visual_score, :music_score, :body, :tag_list)
  end
end
