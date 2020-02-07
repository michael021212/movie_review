class Review < ApplicationRecord
    # body検索機能
    def self.search(search, search_type)
      case search_type
      when '1' # 完全一致
        Review.where(['body LIKE ?', "#{search}"])
      when '2' # 前方一致
        Review.where(['body LIKE ?', "#{search}%"])
      when '3' # 後方一致
        Review.where(['body LIKE ?', "%#{search}"])
      else # 部分一致
        Review.where(['body LIKE ?', "%#{search}%"])
      end
    end

end
