class UserMailer < ApplicationMailer
  default from: 'no-reply@teach-peach.fr'

  def welcome_email(user)
    @user = user
    @url  = 'http://teach-peach.fr/login'
    mail(to: @user.email, subject: 'Bienvenue sur Teach Peach')
  end
end
