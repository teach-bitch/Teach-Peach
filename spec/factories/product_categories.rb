FactoryBot.define do
  factory :product_category do
    title { Faker::Coin.flip }
  end
end
