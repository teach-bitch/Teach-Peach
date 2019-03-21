class AddForAdultToTypeforms < ActiveRecord::Migration[5.2]
  def change
    add_column :typeforms, :for_adult, :boolean, :default => false
  end
end
