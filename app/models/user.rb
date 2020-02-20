class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  validates :name, uniqueness: :true, length: {maximum: 10},
                  format: { with: /\A[a-z0-9]+\z/, message: "を半角英数字で入力してください"}
  enum sex: { '--': 0, 男: 1, 女: 2, その他: 9 }
  has_many :goods
  has_many :bads

  has_many :reviews, dependent: :destroy
  has_many :good_reviews, through: :goods, source: :review # has_many a, through: :b で、bを通したuser.aが使える。aをreviewsにするとhas_many :reviewsと被ってしまう為、sourceにモデル名を書いた上でaの名前を変えている
  has_many :bad_reviews, through: :bads, source: :review # has_many a, through: :b で、bを通したuser.aが使える。aをreviewsにするとhas_many :reviewsと被ってしまう為、sourceにモデル名を書いた上でaの名前を変えている

  has_many :interests

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id # 外部キーをfollowing_idとしているので、フォローする側から見たRelasionships
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id # 外部キーをfollower_idとしているので、フォローされる側から見たRelasionships
  has_many :followers, through: :passive_relationships, source: :following

  attachment :image

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid, provider: auth.provider, email: User.dummy_email(auth), password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  # name検索機能
  def self.search(search_word, search_type)
    case search_type
    when '1' # 完全一致
      User.where(['name LIKE ?', "#{search_word}"])
    when '2' # 前方一致
      User.where(['name LIKE ?', "#{search_word}%"])
    when '3' # 後方一致
      User.where(['name LIKE ?', "%#{search_word}"])
    else # 部分一致
      User.where(['name LIKE ?', "%#{search_word}%"])
    end
  end

  def followed_by?(user)
    passive_relationships.where(following_id: user.id).present? #exists?の方がいいかも
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
