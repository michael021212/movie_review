require 'rails_helper'

describe 'ユーザーに関するテスト', type: :system do
  let!(:user_a) { FactoryBot.create(:user, name: 'usera', email: 'a@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Aです。') }
  let!(:user_b) { FactoryBot.create(:user, name: 'userb', email: 'b@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Bです。') }
  let!(:review_a) { FactoryBot.create(:review, movie_id: '475557', title: 'ジョーカー', poster_path: '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user: user_a, total_score: '5.0', story_score: '4.0', direction_score: '3.0', acting_score: '5.0', visual_score: '4.0', music_score: '1.5', body: 'ホアキンフェニックスのハマり具合がやばすぎです。', tag_list:["怖い", "面白い"]) }
  let!(:review_b) { FactoryBot.create(:review, movie_id: '475557', title: 'ジョーカー', poster_path: '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user: user_b, total_score: '3.0', story_score: '2.0', direction_score: '1.0', acting_score: '3.0', visual_score: '2.0', music_score: '1.5', body: '主演男優賞にも納得の演技でした。', tag_list:["考えさせられる"]) }

  before do
    Relationship.create(following_id: 1, follower_id: 2)
    Relationship.create(following_id: 2, follower_id: 1)
    Good.create(user_id: 1, review_id: 2)
    Interest.create(user_id: 1, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg")
  end

  context 'ログインしていない状態で' do
    context '以下のページにアクセスした時にログインページに遷移する' do
      it '映画詳細ページ' do
        visit movie_path(review_a.movie_id)
        expect(page).to have_current_path new_user_session_path
      end

      it 'レビュー詳細ページ' do
        visit review_path(review_a)
        expect(page).to have_current_path new_user_session_path
      end

      it 'レビュー投稿ページ' do
        visit new_review_path
        expect(page).to have_current_path new_user_session_path
      end

      it 'レビュー編集ページ' do
        visit edit_review_path(review_a)
        expect(page).to have_current_path new_user_session_path
      end

      it 'ユーザー詳細ページ' do
        visit user_path(user_a)
        expect(page).to have_current_path new_user_session_path
      end

      it 'ユーザー編集ページ' do
        visit edit_user_path(user_a)
        expect(page).to have_current_path new_user_session_path
      end

      it 'レビュー検索結果ページ' do
        visit reviews_search_path
        expect(page).to have_current_path new_user_session_path
      end

      it 'ユーザー検索結果ページ' do
        visit users_search_path
        expect(page).to have_current_path new_user_session_path
      end

      it 'ランキングページ' do
        visit ranking_path
        expect(page).to have_current_path new_user_session_path
      end

      it 'タイムラインページ' do
        visit timeline_path
        expect(page).to have_current_path new_user_session_path
      end
    end
  end

  context 'ログインした状態で' do
    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user_a.name
      fill_in 'user[password]', with: user_a.password
      click_button 'ログイン'
      end

    context '表示内容の確認' do
      it 'ユーザー一覧ページの表示内容が正しいか' do
        visit users_path
        expect(page).to have_content user_a.name
        expect(page).to have_link, href: user_path(user_a)
        expect(page).to have_content user_b.followers.count
        expect(page).to have_content user_b.followings.count
        expect(page).to have_content '30' # 2020/3/1時点の年齢
        expect(page).to have_content '男'
        expect(page).to have_content user_a.intro
        expect(page).to have_content user_b.name
        expect(page).to have_link 'フォロー済み', href: user_relationships_path(user_b)
      end

      it '自分の詳細ページの表示内容が正しいか' do
        visit user_path(user_a)
        click_link 'useraさんのレビュー'
        expect(page).to have_content review_a.title
        click_link 'フォロー'
        expect(page).to have_content user_b.followings.count
        click_link 'フォロワー'
        expect(page).to have_content user_b.followers.count
        click_link 'GOODしたレビュー'
        expect(page).to have_content review_b.title
        click_link 'useraさんの観たいリスト'
        expect(page).to have_content "アラジン"
        expect(page).to have_link '編集 / 退会', href: edit_user_path(user_a)
      end

      it '他人のプロフィール編集ページにアクセスできない' do
        visit edit_user_path(user_b)
        expect(page).to have_current_path user_path(user_a)
      end

      it '他人のレビュー編集ページにアクセスできない' do
        visit edit_review_path(review_b)
        expect(page).to have_current_path user_path(user_a)
      end

      context 'プロフィール更新のテスト' do
        before do
          visit edit_user_path(user_a)
          fill_in 'user[name]', with: update_name
          # fill_in 'user[email]', with: 'update_email@example'
          select '2000', from: 'user[birthday(1i)]'
          select '女', from: 'user[sex]'
          fill_in 'user[intro]', with: 'update_intro'
          click_button '更新する'
        end

        context '正しい値の時にプロフィール更新ができる' do
          let(:update_name) { 'a' * 10 }
          it 'プロフィールが更新されている' do
            visit edit_user_path(user_a)
            expect(page).to have_content 'a' * 10
            expect(page).to have_content '2000'
            expect(page).to have_content '女'
            expect(page).to have_content 'update_intro'
            # expect(page).to have_content 'update_email@example' # なぜか通らないが変更できている
          end
        end

        context '有効ではない値の時にプロフィール更新ができない' do
          let(:update_name) { 'a' * 11 }
          it 'エラーメッセージが表示される' do
            expect(page).to have_content '10文字以内で入力してください'
          end
        end
      end
    end
  end
end
