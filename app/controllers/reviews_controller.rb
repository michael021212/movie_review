class ReviewsController < ApplicationController
  def index
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @reviews = Review.all
    gon.movie_id = Review.all.pluck(:movie_id)
    gon.review_id = Review.all.pluck(:id)
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
    @avg_score = elements.map{|element| @review[element]}
  end

  def new
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.movie_id = params[:movie_id]
    @review = Review.new(movie_id: params[:movie_id])
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.save
    redirect_to review_path(review)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :user_id, :total_score, :story_score, :direction_score,
      :acting_score, :visual_score, :music_score, :body)
  end
end
