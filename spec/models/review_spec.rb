require 'rails_helper'

RSpec.describe Review, 'レビューのモデルテスト', type: :model do
  context '保存できる場合' do
    it '全て入力してあるので保存される' do
      user_a = FactoryBot.create(:user)
      expect(FactoryBot.create(:review, user: user_a)).to be_valid
    end
  end

  context '保存できない場合' do
    it "user_idを保存していない" do
      expect(FactoryBot.build(:review)).to_not be_valid
    end

    it "total_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_total_score)).to_not be_valid
    end

    it "story_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_story_score)).to_not be_valid
    end

    it "direction_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_direction_score)).to_not be_valid
    end

    it "acting_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_acting_score)).to_not be_valid
    end

    it "visual_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_visual_score)).to_not be_valid
    end

    it "music_scoreが空欄" do
      expect(FactoryBot.build(:review, :no_music_score)).to_not be_valid
    end

    it "bodyが2001文字以上" do
      expect(FactoryBot.build(:review, :too_long_body)).to_not be_valid
    end
  end
end
