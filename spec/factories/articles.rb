FactoryBot.define do
  factory :article do
    user_id { FactoryBot.create(:user).id }
    title { Faker::Food.fruits }
    content { Faker::GreekPhilosophers.quote }
    for_adult { Faker::Boolean.boolean }
  end
end
