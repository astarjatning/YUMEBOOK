FactoryBot.define do
  factory :diary do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:story) { |n| "story_#{n}" }
    user
  end
end
