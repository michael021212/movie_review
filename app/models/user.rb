class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  validates :name, presence: true
  enum sex: { '--': 0, 男: 1, 女: 2, その他: 9 }
  has_many :reviews, dependent: :destroy

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

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
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
end
