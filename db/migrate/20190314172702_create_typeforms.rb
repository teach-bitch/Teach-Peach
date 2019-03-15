class CreateTypeforms < ActiveRecord::Migration[5.2]
  def change
    create_table :typeforms do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :id_typeform
      t.string :id_results

      t.timestamps
    end
  end
end
