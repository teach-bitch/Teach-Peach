class CreateFacturations < ActiveRecord::Migration[5.2]
  def change
    create_table :facturations do |t|
      t.belongs_to :basket, index: true
      t.decimal :price

      t.timestamps
    end
  end
end
