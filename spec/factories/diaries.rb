FactoryBot.define do
  factory :diary do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:story) { |n| "story_#{n}" }
    user

    trait :diary_yesterday do
      created_at { Time.now.ago(1.day) }
    end
  end
end
