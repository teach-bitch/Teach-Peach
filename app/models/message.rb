class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :body

  validates :name, :email, :phone_number, presence: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, :message => "Veuillez entrer une adresse email valide."
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/, :message => "Un numéro ne peut pas être composé de lettres...!"
  validates :body,
    presence: { message: "Tu as oublié d'écrire ton message !" },
    length: { in: 20..10000, message: "La taille de ton message doit être comprise entre 20 et 10000 caractères." }
end
