FactoryGirl.define do
  factory :user do
    name "user man"
    profile "user profile sample"
    prefecture_id 2
    gender 1
  end

  factory :user_def, class: User do
    name "user man"
    profile "user profile sample"
    prefecture_id 2
    gender 1
  end

  factory :user_sample, class: User do
    name "user man"
    profile "user profile sample"
    prefecture_id 2
    gender 1
  end

end
