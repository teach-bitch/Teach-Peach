class Article < ApplicationRecord
  has_many :article_categories, dependent: :nullify
  has_many :categories, through: :article_categories
  has_many_attached :images

  validates :title,
		presence: { message: "Tu as oublié le titre de ton article !" }

  validates :content,
		presence: { message: "Tu as oublié le contenu de ton article !" }
end
