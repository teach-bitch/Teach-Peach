class Category < ApplicationRecord
  has_many :article_categories, dependent: :nullify
  has_many :articles, through: :article_categories
end
