class MoviesController < ApplicationController
  include Common
  before_action :authenticate_user!, only: [:show]
  before_action :tag_cloud, only: [:index]
  before_action :set_tmdb_key, only: %i[index show]

  def index
    gon.total_scores = Review.select(:movie_id, :total_score)
    gon.reviews = Review.all
    if user_signed_in?
      gon.current_user_reviews = current_user.reviews
      gon.interests = Interest.where(user_id: current_user.id)
    else
      gon.interests = Interest.where(user_id: 0)
    end
    gon.all_interests = Interest.all
    @genres = GENRES
  end

  def show
    gon.movie_id = params[:id]
    @movie_id = params[:id]

    total_scores = Review.where(movie_id: params[:id]).pluck(:total_score) # movie_idが同一のreviewを探してtotal_scoreのみの配列を作る
    gon.total_score_avg = total_scores.sum.fdiv(total_scores.length) # 合計を個数で割って平均を出す

    elements = %i[story_score direction_score acting_score visual_score music_score] # 各スコアを配列にする
    reviews = Review.where(movie_id: params[:id])
    # 各スコアごとに、宣言したreview一つ一つの該当スコアの値を配列にして、スコアごとの配列を作る
    element_scores =
      elements.map do |element|
        reviews.map { |review| review[element] }
      end
    @avg_scores = element_scores.map { |e_score| e_score.sum.fdiv(e_score.length) } # スコアごとの配列を繰り返し処理し、それぞれの配列の合計を個数で割り平均を出す

    @reviews = Review.where(movie_id: params[:id]).page(params[:page]).reverse_order
    gon.reviews = Review.where(movie_id: params[:id])

    gon.interests = Interest.find_by(user_id: current_user.id, movie_id: params[:id]) # current_userが該当のmovieをお気に入り登録済みか確認するための検索
    gon.interest_users = Interest.where(movie_id: params[:id]).count # 該当のmovieをお気に入りしているuserの数を調べる
  end

  private

  def tag_cloud
    @tags = tags_desc
  end
end
