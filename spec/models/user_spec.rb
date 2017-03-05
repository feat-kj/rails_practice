require 'rails_helper'

RSpec.describe User, type: :model do

  # validationテスト
  describe '#model validate' do

    describe '#model' do
      it "登録正常" do
        user = build(:user)
        expect(user).to be_valid
        expect(user.errors[:name]).to be_blank
      end
    end

    describe '#name' do
      it "必須確認" do
        user = build(:user)
        user.name = ""
        expect(user).not_to be_valid
        expect(user.errors[:name]).to be_present
      end
      it "文字数OK" do
        user = build(:user)
        user.name = "T" * 20
        expect(user).to be_valid
        expect(user.errors[:name]).to be_blank
      end
      it "文字数エラー" do
        user = build(:user)
        user.name = "T" * 21
        expect(user).not_to be_valid
        expect(user.errors[:name]).to be_present
      end
    end

    describe '#profile' do
      it "必須確認" do
        user = build(:user)
        user.profile = ""
        expect(user).not_to be_valid
        expect(user.errors[:profile]).to be_present
      end
      it "文字数OK" do
        user = build(:user)
        user.profile = "T" * 100
        expect(user).to be_valid
        expect(user.errors[:profile]).to be_blank
      end
      it "文字数エラー" do
        user = build(:user)
        user.profile = "T" * 101
        expect(user).not_to be_valid
        expect(user.errors[:profile]).to be_present
      end
    end

    describe '#gender' do
      it "必須確認" do
        user = build(:user)
        user.gender = nil
        expect(user).not_to be_valid
        expect(user.errors[:gender]).to be_present
      end
      it "範囲チェックOK" do
        user = build(:user)
        user.gender = 2
        expect(user).to be_valid
        expect(user.errors[:gender]).to be_blank
      end
      it "範囲チェックエラー" do
        user = build(:user)
        user.gender = 3
        expect(user).not_to be_valid
        expect(user.errors[:gender]).to be_present
      end
      it "範囲チェックエラー" do
        user = build(:user)
        user.gender = 0
        expect(user).not_to be_valid
        expect(user.errors[:gender]).to be_present
      end
    end

    describe '#prefecture' do
      it "必須確認" do
        user = build(:user)
        user.prefecture_id = nil
        expect(user).not_to be_valid
        expect(user.errors[:prefecture_id]).to be_present
      end
      it "範囲チェックOK" do
        user = build(:user)
        user.prefecture_id = 32
        expect(user).to be_valid
        expect(user.errors[:prefecture_id]).to be_blank
      end
      it "範囲チェックエラー" do
        user = build(:user)
        user.prefecture_id = 48
        expect(user).not_to be_valid
        expect(user.errors[:prefecture_id]).to be_present
      end
      it "範囲チェックエラー" do
        user = build(:user)
        user.prefecture_id = 0
        expect(user).not_to be_valid
        expect(user.errors[:prefecture_id]).to be_present
      end
    end
  end

  # createテスト
  describe '#model create' do
    describe '#model' do
      it "登録正常" do
        user = create(:user)
        expect(User.find(user.id)).to eq(user)
        expect(UserAuth.find_by(user_id: user.id)).to eq(user.user_auth)
      end

      it "ユーザー認証情報なし" do
        user = build(:user)
        user.user_auth = nil
        expect {User.create!(user)}.to raise_error(ArgumentError)
      end

      it "関連データのvalidate有効チェック" do
        user = build(:user)
        user.user_auth = UserAuth.new
        user.user_auth.email = "aaa@example.com"
        expect {User.create!(user)}.to raise_error(ArgumentError)
      end
    end
  end

  # updateテスト
  describe '#model update' do
    describe '#model' do
      it "更新正常" do
        new_name = "更新テスト"
        user = create(:user)
        user.update!({name: new_name})
        update_user = User.find(user.id)
        expect(update_user.name).to eq(new_name)
      end
    end
  end

end
