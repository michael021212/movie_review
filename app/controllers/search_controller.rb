class SearchController < ApplicationController
  include Common
  before_action :tag_cloud
  before_action :set_tmdb_key, only: [:search]

  def search
    @genres = GENRES
    gon.reviews = Review.all
    gon.all_interests = Interest.all
    if user_signed_in?
      gon.current_user_reviews = current_user.reviews
      gon.interests = Interest.where(user_id: current_user.id)
    else
      gon.interests = Interest.where(user_id: 0)
    end

    case params[:select]
    when '1' # 映画 Movieモデルはないのでjsに変数を渡してapiの検索機能を使う
      gon.search_word = params[:search_word]
      gon.total_scores = Review.select(:movie_id, :total_score)
    when '2' # レビュー
      authenticate_user!
      @reviews = Review.search(params[:search_word], params[:search_type]).page(params[:page]).reverse_order
    when '3' # ユーザー
      authenticate_user!
      @users = User.search(params[:search_word], params[:search_type])
    end

    if params[:genre_id]
      @genre = @genres.find{|genre| genre[:id] == params[:genre_id].to_i}
      gon.total_scores = Review.select(:movie_id, :total_score)
    end

    if params[:tag_search]
      authenticate_user!
      @reviews = Review.tagged_with(params[:tag_search]).page(params[:page]).reverse_order
      gon.movie_id = @reviews.pluck(:movie_id)
      gon.review_id = @reviews.pluck(:id)
    end
  end

  private

  def tag_cloud
    @tags = tags_desc
  end
end
