class SearchController < ApplicationController
  before_action :tag_cloud

  def search
    @genres = GENRES
    case params[:select]
    when '1' # 映画 Movieモデルはないのでjsに変数を渡してapiの検索機能を使う
      gon.TMDb_KEY = ENV['TMDb_KEY']
      gon.search_word = params[:search_word]
    when '2' # レビュー
      @reviews = Review.search(params[:search_word], params[:search_type])
    when '3' # ユーザー
      @users = User.search(params[:search_word], params[:search_type])
    end

    if params[:genre_id]
      @genre = @genres.find{|genre| genre[:id] == params[:genre_id].to_i}
      gon.TMDb_KEY = ENV['TMDb_KEY']
      gon.total_scores = Review.select(:movie_id, :total_score)
      gon.reviews = Review.all
      if user_signed_in?
        gon.current_user_reviews = current_user.reviews
        gon.interests = Interest.where(user_id: current_user.id)
      end
      gon.interests = Interest.where(user_id: 0)
      gon.all_interests = Interest.all
    end

    if params[:tag_search]
      @reviews = Review.tagged_with(params[:tag_search])
    end
  end

  def tag_cloud
    @tags = Review.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end
end
