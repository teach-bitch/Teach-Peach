class AddCustomerIdToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :customer_id
    end
  end
end
