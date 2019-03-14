class AddSubscriptionIdToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :subscription_id
    end
  end
end
