module Common
  extend ActiveSupport::Concern

  private

  def tags_desc
    Review.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end

  def set_tmdb_key
    gon.TMDb_KEY = ENV['TMDb_KEY']
  end
end
