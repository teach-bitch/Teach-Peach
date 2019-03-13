class ArticleCategory < ApplicationRecord
  belongs_to :article, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
