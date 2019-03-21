FactoryBot.define do
  factory :line_item do
    quantity { Faker::Number.number(2) }
    basket_id { FactoryBot.create(:basket).id }
    product_id { FactoryBot.create(:product).id }
  end
end
