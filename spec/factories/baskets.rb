FactoryBot.define do
  factory :basket do
    user_id { FactoryBot.create(:user).id }
  end
end
