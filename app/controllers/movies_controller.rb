class MoviesController < ApplicationController
  def index
    tag_cloud
    gon.TMDb_KEY = ENV['TMDb_KEY']
    gon.total_scores = Review.select(:movie_id, :total_score)
    gon.reviews = Review.all
    if user_signed_in?
      gon.current_user_reviews = current_user.reviews
      gon.interests = Interest.where(user_id: current_user.id)
    end
    gon.interests = Interest.where(user_id: 0)
    gon.all_interests = Interest.all
    @genres = GENRES
  end

  def show
    gon.TMDb_KEY = ENV['TMDb_KEY']
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

    @reviews = Review.where(movie_id: params[:id])
    gon.reviews = Review.where(movie_id: params[:id])

    gon.interests = Interest.find_by(user_id: current_user.id, movie_id: params[:id]) # current_userが該当のmovieをお気に入り登録済みか確認するための検索
    gon.interest_users = Interest.where(movie_id: params[:id]).count # 該当のmovieをお気に入りしているuserの数を調べる
  end

  def tag_cloud
    @tags = Review.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end

  # ajaxで送られたdataの処理
  def movie_data
    @content = params[:content]
    @title = @content[:title]
  end
end
