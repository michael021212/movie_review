class MoviesController < ApplicationController
  def index
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.total_scores = Review.select(:movie_id, :total_score)
    gon.reviews = Review.all
    gon.current_user_reviews = current_user.reviews
    gon.interests = Interest.where(user_id: current_user.id)
    gon.all_interests = Interest.all
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.movie_id = params[:id]
    @movie_id = params[:id]

    total_scores = Review.where(movie_id: params[:id]).pluck(:total_score) # movie_idが同一のreviewを探してtotal_scoreのみの配列を作る
    gon.total_score_avg = total_scores.sum.fdiv(total_scores.length) # 合計を個数で割って平均を出す

    @reviews = Review.where(movie_id: params[:id])
    gon.reviews = Review.where(movie_id: params[:id])

    gon.interests = Interest.find_by(user_id: current_user.id, movie_id: params[:id]) # current_userが該当のmovieをお気に入り登録済みか確認するための検索
    gon.interest_users = Interest.where(movie_id: params[:id]).count # 該当のmovieをお気に入りしているuserの数を調べる
  end

  # ajaxで送られたdataの処理
  def movie_data
    @content = params[:content]
    @title = @content[:title]
  end
end
