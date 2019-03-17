FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    brand { "MyString" }
    price { "9.99" }
    quantity { 1 }
    reference { "MyString" }
  end
end
