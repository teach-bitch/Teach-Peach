FactoryBot.define do
  factory :facturation do
    price { Faker::Number.decimal(2) }
  end
end
