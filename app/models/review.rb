class Review < ApplicationRecord
    # body検索機能
    def self.search(search_word, search_type)
      case search_type
      when '1' # 完全一致
        Review.where(['body LIKE ?', "#{search_word}"])
      when '2' # 前方一致
        Review.where(['body LIKE ?', "#{search_word}%"])
      when '3' # 後方一致
        Review.where(['body LIKE ?', "%#{search_word}"])
      else # 部分一致
        Review.where(['body LIKE ?', "%#{search_word}%"])
      end
    end

end
