class Article < ApplicationRecord
  has_many :article_categories, dependent: :nullify
  has_many :categories, through: :article_categories

<<<<<<< HEAD
=======
  validates :title,
		presence: { message: "Tu as oublié le titre de ton article !" }

  validates :content,
		presence: { message: "Tu as oublié le contenu de ton article !" }
>>>>>>> Add validates and error messages
end
