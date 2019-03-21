FactoryBot.define do
  factory :typeform do
    title { Faker::House.furniture }
    description { Faker::GreekPhilosophers.quote }
    id_typeform { Faker::IDNumber.brazilian_citizen_number }
  end
end
