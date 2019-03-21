FactoryBot.define do
  factory :join_product_category do
    product_id { FactoryBot.create(:product).id }
    product_category_id { FactoryBot.create(:product_category).id }
  end
end
