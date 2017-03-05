require 'rails_helper'

RSpec.describe UserAuth, type: :model do
  # validationテスト
  describe '#model validate' do

    describe '#model' do
      it "validate正常" do
        user_auth = build(:user_auth)
        expect(user_auth).to be_valid
      end
    end

    describe '#email' do
      it "必須確認" do
        user_auth = build(:user_auth)
        user_auth.email = ""
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:email]).to be_present
      end
      it "形式チェックOK" do
        user_auth = build(:user_auth)
        user_auth.email = "aaaa@bbb.com"
        expect(user_auth).to be_valid
        expect(user_auth.errors[:email]).to be_blank
      end
      it "形式チェックNG" do
        user_auth = build(:user_auth)
        user_auth.email = "aaaa@bbb"
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:email]).to be_present
      end
    end

    describe '#password' do
      it "必須確認" do
        user_auth = build(:user_auth)
        user_auth.password = ""
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:password]).to be_present
      end
      it "文字数OK" do
        password = "AbcD1234"
        user_auth = build(:user_auth)
        user_auth.password = password
        user_auth.password_confirmation = password
        expect(user_auth).to be_valid
        expect(user_auth.errors[:password]).to be_blank
      end
      it "文字数エラー" do
        password = "AbcDE12" * 3
        user_auth = build(:user_auth)
        user_auth.password = password
        user_auth.password_confirmation = password
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:password]).to be_present
      end
      it "形式OK" do
        password = "AbcD1234"
        user_auth = build(:user_auth)
        user_auth.password = password
        user_auth.password_confirmation = password
        expect(user_auth).to be_valid
        # expect(user_auth.errors[:password]).to be_blank
      end
      it "形式エラー" do
        password = "ABCD1234"
        user_auth = build(:user_auth)
        user_auth.password = password
        user_auth.password_confirmation = password
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:password]).to be_present
      end
    end

    describe '#password_confirmation' do
      it "password同一" do
        user_auth = build(:user_auth)
        user_auth.password_confirmation = "1234Abcdef"
        expect(user_auth).not_to be_valid
        expect(user_auth.errors[:password_confirmation]).to be_present
      end
    end
  end
end
