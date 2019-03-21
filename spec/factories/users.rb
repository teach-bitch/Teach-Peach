FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    email { Faker::Internet.email }
    password { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.birthday(18, 65) }
    customer_id { Faker::IDNumber.brazilian_citizen_number }
    subscription_id { Faker::IDNumber.brazilian_citizen_number }
  end
end
