FactoryBot.define do
  factory :facturation do
    user_id { FactoryBot.create(:user).id }
    price { Faker::Number.decimal(2) }
    basket_id { FactoryBot.create(:basket).id }    
  end
end
