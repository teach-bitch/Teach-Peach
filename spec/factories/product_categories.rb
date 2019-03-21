FactoryBot.define do
  factory :product_category do
    title { Faker::Food.sushi }
  end
end
