class MoviesController < ApplicationController
  def index
  end

  def show
    @movie_id = params[:id]
    gon.movie_id = params[:id]
  end

  # ajaxで送られたdataの処理
  def movie_data
    @content = params[:content]
    @title = @content[:title]
  end
end
