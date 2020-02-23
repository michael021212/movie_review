class Review < ApplicationRecord
  belongs_to :user
  has_many :goods
  has_many :bads

  validates :total_score, presence: true
  validates :story_score, presence: true
  validates :direction_score, presence: true
  validates :acting_score, presence: true
  validates :visual_score, presence: true
  validates :music_score, presence: true

  validates :body, length: { maximum: 2000 }

  # タグ機能
  acts_as_taggable # acts_as_taggable_on :tagsのエイリアス

  # body検索機能 レビュー一覧ページに検索機能つけたので廃止
  # def self.search(search_word, search_type)
  #   case search_type
  #   when '1' # 完全一致
  #     Review.where(['body LIKE ?', "#{search_word}"])
  #   when '2' # 前方一致
  #     Review.where(['body LIKE ?', "#{search_word}%"])
  #   when '3' # 後方一致
  #     Review.where(['body LIKE ?', "%#{search_word}"])
  #   else # 部分一致
  #     Review.where(['body LIKE ?', "%#{search_word}%"])
  #   end
  # end

  # goodsの中に、引数で渡されたuserのidを持つレコードがあるかの判定をする
  def good_by?(user)
    goods.where(user_id: user.id).present? # exists?の方がいいかも
  end

  # badsの中に、引数で渡されたuserのidを持つレコードがあるかの判定をする
  def bad_by?(user)
    bads.where(user_id: user.id).present? # exists?の方がいいかも
  end

  def self.good_ranks
    Review.find(Good.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def self.bad_ranks
    Review.find(Bad.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def self.count_ranks
    Review.group(:movie_id, :title, :poster_path).select('reviews.movie_id, reviews.title, reviews.poster_path, count(movie_id) as review_count').order('review_count desc').limit(3)
  end
end
