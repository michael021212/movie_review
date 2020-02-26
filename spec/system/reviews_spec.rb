require 'rails_helper'

describe 'レビュー管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'usera', email: 'a@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Aです。') }
  let(:user_b) { FactoryBot.create(:user, name: 'userb', email: 'b@example.com', password: 'password', birthday: '1990-01-01', sex: '男', intro: 'Bです。') }
  let!(:review_a) { FactoryBot.create(:review, movie_id: '475557', title: 'ジョーカー', poster_path: '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user: user_a, total_score: '5.0', story_score: '4.0', direction_score: '3.0', acting_score: '5.0', visual_score: '4.0', music_score: '1.5', body: 'ホアキンフェニックスのハマり具合がやばすぎです。', tag_list:["怖い", "面白い"]) }
  let!(:review_b) { FactoryBot.create(:review, movie_id: '475557', title: 'ジョーカー', poster_path: '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user: user_b, total_score: '3.0', story_score: '2.0', direction_score: '1.0', acting_score: '3.0', visual_score: '2.0', music_score: '1.5', body: '主演男優賞にも納得の演技でした。', tag_list:["考えさせられる"]) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: login_user.name
    fill_in 'user[password]', with: login_user.password
    click_button 'ログイン'
    visit reviews_path
  end

  shared_examples_for 'ユーザーAが作成したレビューが正しく表示される' do
    it { expect(page).to have_content 'ジョーカー' } # タイトル
    it { expect(page).to have_content 'ホアキン' } # 本文
    it { expect(page).to have_content '怖い' } # タグ
    it { expect(page).to have_content '5.0' } # 総合スコア
    it { expect(page).to have_selector("img[src$='https://image.tmdb.org/t/p/w200/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg']") } # ポスター画像
  end
  shared_examples_for 'ユーザーBが作成したレビューが正しく表示される' do
    it { expect(page).to have_content 'ジョーカー' }
    it { expect(page).to have_content '主演男優賞' }
    it { expect(page).to have_content '考えさせられる' }
    it { expect(page).to have_content '3.0' }
    it { expect(page).to have_selector("img[src$='https://image.tmdb.org/t/p/w200/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg']") } # ポスター画像
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成したレビューが正しく表示される'
      it 'GOOD/BADボタン、観たいボタン、フォローするボタンの表示とリンクは正しいか' do
        expect(page).to have_link "0", href: review_good_path(review_b)
        expect(page).to have_link "0", href: review_bad_path(review_b)
        expect(page).to have_link "この映画を観たい", href: movie_interest_path(movie_id: review_b.movie_id, title: review_b.title, poster_path: review_b.poster_path)
        expect(page).to have_link "このユーザーをフォローする", href: user_relationships_path(review_b.user)
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it_behaves_like 'ユーザーAが作成したレビューが正しく表示される'
      it_behaves_like 'ユーザーBが作成したレビューが正しく表示される'
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAが自分のレビューの詳細ページへ移動した時' do
      let(:login_user) { user_a }

      before do
        visit review_path(review_a)
      end

      it_behaves_like 'ユーザーAが作成したレビューが正しく表示される'
      it 'GOOD/BADボタン、観たいボタン、レビューするボタンの表示とリンクは正しいか' do
        expect(page).to have_link "0", href: review_good_path(review_a)
        expect(page).to have_link "0", href: review_bad_path(review_a)
        expect(page).to have_link "この映画を観たい", href: movie_interest_path(movie_id: review_a.movie_id, title: review_a.title, poster_path: review_a.poster_path)
        expect(page).to have_link "レビュー済み", href: review_path(review_a)
      end
      # it '各種スコアが正しく表示される' do
      #   # チャートが正しく表示される
      # end
    end

    context 'ユーザーAがユーザーBのレビューの詳細ページへ移動した時' do
      let(:login_user) { user_a }

      before do
        visit review_path(review_b)
      end

      it_behaves_like 'ユーザーBが作成したレビューが正しく表示される'
      it 'GOOD/BADボタン、観たいボタン、レビューするボタンの表示とリンクは正しいか' do
        expect(page).to have_link "0", href: review_good_path(review_b)
        expect(page).to have_link "0", href: review_bad_path(review_b)
        expect(page).to have_link "この映画を観たい", href: movie_interest_path(movie_id: review_b.movie_id, title: review_b.title, poster_path: review_b.poster_path)
        expect(page).to have_link "レビュー済み", href: review_path(review_a)
        expect(page).to have_link "このユーザーをフォローする", href: user_relationships_path(review_b.user)
      end
    end
  end

  describe 'レビュー投稿機能' do
    # context '正しく投稿した時' do
    #   let(:login_user) { user_a }

    #   before do
    #     visit new_review_path(movie_id: '420817', title: 'アラジン', poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg")
    #     # スコアを入力
    #     # タグを入力
    #     # 本文を入力
    #   end

    #   it '正しく保存され、リダイレクト先が正しいか' do
    #     click_button '投稿する'
    #     expect(page).to have_current_path review_path(@review) # @reviewでいいのか
    #     expect(page).to have_content 'レビューを投稿しました'
    #   end
    # end

    context '有効ではない投稿をした時' do
      let(:login_user) { user_a }

      before do
        visit new_review_path(movie_id: '420817', title: 'アラジン', poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg")
      end

      it '保存されないか' do
        click_button '投稿する'
        expect(page).to have_current_path new_review_path(movie_id: '420817', title: 'アラジン', poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg")
        expect(page).to have_content 'を入力してください'
      end
    end
  end
end

# describe 'タグ機能', type: :system do

# end

# describe 'GOOD/BAD機能', type: :system do

# end

# describe '観たい機能', type: :system do

# end