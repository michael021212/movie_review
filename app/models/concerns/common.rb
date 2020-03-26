module Common
  extend ActiveSupport::Concern

  def categories
    ArticleCategory.order(:id).all
  end

  private

  def tags
    Review.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end
end
