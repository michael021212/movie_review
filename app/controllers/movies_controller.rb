class MoviesController < ApplicationController
  def index
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.total_scores = Review.select(:movie_id, :total_score)
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.movie_id = params[:id]
    @movie_id = params[:id]

    total_scores = Review.where(movie_id: params[:id]).pluck(:total_score) # movie_idが同一のreviewを探してtotal_scoreのみの配列を作る
    gon.total_score_avg = total_scores.sum.fdiv(total_scores.length) # 合計を個数で割って平均を出す

    @reviews = Review.where(movie_id: params[:id])
  end

  # ajaxで送られたdataの処理
  def movie_data
    @content = params[:content]
    @title = @content[:title]
  end
end
