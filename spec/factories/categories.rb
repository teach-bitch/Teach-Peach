FactoryBot.define do
  factory :category do
    title { Faker::DcComics.unique.villain}
  end
end
