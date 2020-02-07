class MoviesController < ApplicationController
  def index
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.total_score = Review.last.total_score
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
    @movie_id = params[:id]
    gon.movie_id = params[:id]
  end

  # ajaxで送られたdataの処理
  def movie_data
    @content = params[:content]
    @title = @content[:title]
  end
end
