class Product < ApplicationRecord
#  has_one_attached :image
  has_many :line_items, dependent: :nullify
  has_many :join_product_categories
  has_many :product_categories, through: :join_product_categories

  validates :name,
    presence: true,
    length: { in: 3..140 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0, less_than: 1001 }

  validates :description,
    presence: true,
    length: { in: 10..1000 }

end
