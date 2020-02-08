class SearchController < ApplicationController
  def search
    case params[:select]
    when '1' # 映画 Movieモデルはないのでjsに変数を渡してapiの検索機能を使う
      gon.TMDb_KEY = ENV['TMDb_KEY']
      gon.search_word = params[:search_word]
    when '2' # レビュー
      @reviews = Review.search(params[:search_word], params[:search_type])
    when '3' # ユーザー
      @users = User.search(params[:search_word], params[:search_type])
    end
  end
end
