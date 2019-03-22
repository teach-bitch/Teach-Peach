FactoryBot.define do
  factory :typeform do
    user_id { FactoryBot.create(:user).id }
    for_adult { Faker::Boolean.boolean }
    title { Faker::House.furniture }
    description { Faker::GreekPhilosophers.quote }
    id_typeform { Faker::IDNumber.brazilian_citizen_number }
    id_results { Faker::IDNumber.brazilian_citizen_number }
  end
end
