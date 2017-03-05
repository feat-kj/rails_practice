FactoryGirl.define do
  factory :user do
    name "テストユーザー"
    profile "テストサンプルプロフィール"
    prefecture_id 2
    gender 1
    after(:build) do |user|
      user.user_auth ||= FactoryGirl.build(:user_auth, user: user)
    end
    trait :blank_profile do
      profile nil
    end
    trait :update_name do
      name "更新テストユーザー"
    end
  end

  factory :user_auth do
    email "test@test.com"
    password "passworD1234"
    password_confirmation "passworD1234"
  end

end
