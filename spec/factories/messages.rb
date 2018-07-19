FactoryGirl.define do
  factory :message do
    text FFaker::Lorem.sentence(5)
    user

    trait :reindex do
      after(:create) do |message, _evaluator|
        message.reindex(refresh: true)
      end
    end
  end
end
