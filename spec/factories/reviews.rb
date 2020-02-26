FactoryBot.define do
  factory :review do
    movie_id { '1' }
    title { 'タイトル' }
    poster_path { '/a.jpg' }
    user {}
    total_score { '1.0' }
    story_score { '1.0' }
    direction_score { '1.0' }
    acting_score { '1.0' }
    visual_score { '1.0' }
    music_score { '1.0' }
    body { '本文' }
  end

  trait :no_total_score do
    total_score {}
  end

  trait :no_story_score do
    story_score {}
  end

  trait :no_direction_score do
    direction_score {}
  end

  trait :no_acting_score do
    acting_score {}
  end

  trait :no_visual_score do
    visual_score {}
  end

  trait :no_music_score do
    music_score {}
  end

  trait :too_long_body do
    body { 'a' * 2001 }
  end
end