require 'rails_helper'

RSpec.describe User, 'ユーザーのモデルテスト', type: :model do
  context '保存できる場合' do
    it '全て入力してあるので保存される' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  context '保存できない場合' do
    it "nameが空欄" do
      expect(FactoryBot.build(:user, :no_name)).to_not be_valid
    end

    it "nameが漢字" do
      expect(FactoryBot.build(:user, :kanji_name)).to_not be_valid
    end

    it "nameがひらがな" do
      expect(FactoryBot.build(:user, :hiragana_name)).to_not be_valid
    end

    it "nameがカタカナ" do
      expect(FactoryBot.build(:user, :katakana_name)).to_not be_valid
    end

    it "nameが11文字以上" do
      expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
    end

    it "既に使われているname" do
      FactoryBot.create(:user)
      expect(FactoryBot.build(:user, name: 'usera', email: 'test2@example.com', password: 'password')).to_not be_valid
    end
  end
end
