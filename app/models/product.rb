class Product < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_many :join_product_categories
  has_many :product_categories, through: :join_product_categories
  has_many_attached :images

  validates :name,
    presence: { message: "Tu as oublié de spécifier le nom du produit !" }
    length: { in: 3..140 }

  validates :price,
    presence: { message: "Tu as oublié de spécifier le prix!" }
    numericality: { greater_than: 0, less_than: 1001 }

  validates :description,
    presence: { message: "Tu as oublié de spécifier une description !" }
    length: { in: 10..1000 }

end
