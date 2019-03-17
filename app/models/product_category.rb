class ProductCategory < ApplicationRecord
  has_many :join_product_categories
  has_many :products, through: :join_product_categories

  validates :title,
  presence: true,
  length: { in: 2..15 }
end
