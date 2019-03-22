FactoryBot.define do
  factory :product do
    name { Faker::FunnyName.name }
    description { Faker::GreekPhilosophers.quote }
    brand { Faker::Company.name }
    price { Faker::Number.decimal(2).to_f }
    quantity { Faker::Number.number(2).to_i }
    reference { Faker::IDNumber.brazilian_citizen_number }
  end
end
