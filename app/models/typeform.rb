class Typeform < ApplicationRecord
after_create :new_typeform_send

  validates :title,
		presence: { message: "Tu as oublié le titre du formulaire !" }

  validates :description,
    presence: { message: "Tu as oublié la description du formulaire !" }

  validates :id_typeform,
    presence: { message: "Tu as oublié de mettre le lien vers le formulaire !" }

  validates :id_results,
    presence: { message: "Tu as oublié de mettre le lien vers les résultats du formulaire !" }

  def new_typeform_send
    UserMailer.new_typeform_email(self).deliver_now
  end
end
