class CreateTypeforms < ActiveRecord::Migration[5.2]
  def change
    create_table :typeforms do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :id_typeform
<<<<<<< HEAD
      t.string :id_results
=======
>>>>>>> 78eaa779451768f9fac6805b6d6b9a35b06f8000

      t.timestamps
    end
  end
end
