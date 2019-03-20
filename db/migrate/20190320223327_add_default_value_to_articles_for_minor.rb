class AddDefaultValueToArticlesForMinor < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :for_adult, :boolean, :default => false
  end
end
