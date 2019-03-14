class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :title,
		presence: { message: "Tu as oublié le titre de la catégorie !" }
end
