FactoryBot.define do
  factory :student do
    name { "MyString" }
    kana { "MyString" }
    email { "MyString" }
    birthdate { 1 }
    school { "MyString" }
    memo { "MyText" }
  end
end
