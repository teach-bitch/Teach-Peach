class Article < ApplicationRecord
  has_many :article_categories, dependent: :nullify
  has_many :categories, through: :article_categories

end
