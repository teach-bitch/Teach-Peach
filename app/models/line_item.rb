class LineItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  default_scope { order('created_at DESC') }
end
