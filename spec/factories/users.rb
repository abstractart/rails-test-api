FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  sequence :nickname do |n|
    "user_nickname#{n}"
  end

  factory :user do
    email
    nickname
    password FFaker::Internet.password(8, 20)

    factory :user_with_messages do
      transient do
        messages_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:message, evaluator.messages_count, user: user)
      end
    end
  end
end
