FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:email) { |n| "email_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :general }

    trait :admin do
      sequence(:name){ |n| "admin_#{n}" }
      role { :admin }
    end
  end
end
