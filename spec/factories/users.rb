FactoryBot.define do
  factory :user do
    name { 'usera' }
    email { 'test1@example.com' }
    password { 'password' }
    birthday { '1990-01-01' }
    sex { '男' }
    intro { 'テストユーザーです。' }
  end
end