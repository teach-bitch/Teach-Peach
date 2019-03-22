class UserMailer < ApplicationMailer
  default from: 'no-reply@teach-peach.fr'

  def welcome_email(user)
    @user = user
    @url = 'https://www.teach-peach.fr'
    mail(to: @user.email, subject: 'Bienvenue sur Teach Peach')
  end

  def subscribe_email(user)
    @user = user
    @url = 'https://www.teach-peach.fr/abonnements'
    # check if user is not subscribed yet nor minor
    if (user.role != 'user_minor') && (user.subscription_id == nil)
      mail(to: @user.email, subject: 'As-tu vu nos abonnements')
    end
  end

  def contact_email_from_user(message)
    @message = message
    @url = 'https://www.teach-peach.fr'
    mail(to: 'teach-peach@yopmail.com', subject: 'Bienvenue sur Teach Peach')
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
