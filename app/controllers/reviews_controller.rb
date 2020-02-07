class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new(movie_id: params[:movie_id], user_id: current_user.id)
  end

  def create
    review = Review.new(review_params)
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
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :user_id, :total_score, :story_score, :direction_score,
      :acting_score, :visual_score, :music_score, :body)
  end
end
