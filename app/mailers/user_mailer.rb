class UserMailer < ApplicationMailer
  default from: 'no-reply@teach-peach.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://teach-peach.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_typeform_email(typeform)

    @typeform = typeform
    @url  = 'http://teach-peach.fr'
    @users = User.all

    mail(
    bcc: @users.map(&:email).uniq,
    subject: 'Nouveau formulaire disponible sur teach peach !'
    )

end

end
