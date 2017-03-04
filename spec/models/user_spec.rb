require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー登録正常" do
    user = create(:user)
    expect(User.find(user.id)).to eq(user)
  end

  it "性別必須" do
    user = build(:user)
    user.gender = nil
    expect(user).not_to be_valid
    expect(user.errors[:gender]).to be_present
  end

  it "性別が指定値以外" do
  end

  it "都道府県必須" do
  end

  it "都道府県が指定値以外" do
  end

  it "プロフィールが必須" do
  end

  it "プロフィール文字数チェック" do
  end

  it "メールアドレス" do
  end

  it "メールアドレス形式チェック" do
  end

  it "パスワードチェック" do
  end

  it "パスワード形式" do
  end

end
