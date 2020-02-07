class SearchController < ApplicationController
  def search
    case params[:select]
    when '1' # 映画 Movieモデルはないので下記の処理では検索不可
      @movies = Movie.search(params[:search], params[:search_type])
    when '2' # レビュー
      @reviews = Review.search(params[:search], params[:search_type])
    when '3' # ユーザー
      @users = User.search(params[:search], params[:search_type])
    end
  end
end
