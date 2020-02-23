require 'rails_helper'

describe 'レビュー管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'usera', email: 'a@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Aです。') }
  let(:user_b) { FactoryBot.create(:user, name: 'userb', email: 'b@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Bです。') }
  let!(:review_a) { FactoryBot.create(:review, movie_id: '475557', title: 'ジョーカー', poster_path: '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user: user_a, total_score: '5.0', story_score: '4.5', direction_score: '3.0', acting_score: '2.5', visual_score: '2.0', music_score: '1.5', body: 'ホアキンフェニックスのハマり具合がやばすぎです。' ) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: login_user.name
    fill_in 'user[password]', with: login_user.password
    click_button 'ログイン'
    visit reviews_path
  end

  shared_examples_for 'ユーザーAが作成したレビューが表示される' do
    it { expect(page).to have_content 'ジョーカー' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成したレビューが表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it_behaves_like 'ユーザーAが作成したレビューが表示される'
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit review_path(review_a)
      end

      it_behaves_like 'ユーザーAが作成したレビューが表示される'
    end
  end

  describe '新規作成機能' do
    context '新規作成画面で総合スコアを入力した時' do

    end
  end

end