FactoryBot.define do
  factory :review do
    movie_id { '1' }
    title { 'タイトル' }
    poster_path { '/a.jpg' }
    user
    total_score { '1.0' }
    story_score { '1.0' }
    direction_score { '1.0' }
    acting_score { '1.0' }
    visual_score { '1.0' }
    music_score { '1.0' }
    body { '本文' }
  end
end