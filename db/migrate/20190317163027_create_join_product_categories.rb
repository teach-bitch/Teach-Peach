class CreateJoinProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :join_product_categories do |t|
      t.belongs_to :product, index: true
      t.belongs_to :product_category, index: true

      t.timestamps
    end
  end
end
