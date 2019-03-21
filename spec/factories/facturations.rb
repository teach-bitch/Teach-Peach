FactoryBot.define do
  factory :facturation do
    price { Faker::Number.decimal(2) }
    basket_id { FactoryBot.create(:basket).id }
    user_id { FactoryBot.create(:user).id }
  end
end
