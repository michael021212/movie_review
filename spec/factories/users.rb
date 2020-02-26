FactoryBot.define do
  factory :user do
    name { 'usera' }
    email { 'test1@example.com' }
    password { 'password' }
    birthday { '1990-01-01' }
    sex { '男' }
    intro { 'テストユーザーです。' }
  end

  trait :no_name do
    name {}
  end

  trait :kanji_name do
    name { '山田' }
  end

  trait :hiragana_name do
    name { 'やまだ' }
  end

  trait :katakana_name do
    name { 'ヤマダ' }
  end

  trait :too_long_name do
    name { 'a' * 11 }
  end
end