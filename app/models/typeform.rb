class Typeform < ApplicationRecord

  validates :title,
		presence: { message: "Tu as oublié le titre du formulaire !" }

  validates :description,
    presence: { message: "Tu as oublié la description du formulaire !" }

  validates :id_typeform,
    presence: { message: "Tu as oublié de mettre le lien vers le formulaire !" }

  validates :id_results,
    presence: { message: "Tu as oublié de mettre le lien vers les résultats du formulaire !" }
end
