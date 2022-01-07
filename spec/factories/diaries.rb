FactoryBot.define do
  factory :diary do
    date { "2022-01-04 19:45:24" }
    title { "MyString" }
    story { "MyString" }
    user { nil }
  end
end
