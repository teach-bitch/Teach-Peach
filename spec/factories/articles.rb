FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    is_adult { false }
  end
end
