FactoryBot.define do
  factory :article_category do
    category_id { FactoryBot.create(:category).id }
    article_id { FactoryBot.create(:article).id }
  end
end
