class UserMailer < ApplicationMailer
  default from: 'no-reply@teach-peach.fr'

  def welcome_email(user)
    @user = user
    @url  = 'http://teach-peach.fr/login'
    mail(to: @user.email, subject: 'Bienvenue sur Teach Peach')
  end

  def subscribe_email
    @users = User.all
    users_to_remind_about_sub = []
    # Find all users whom are not minor nor subscriber and add them to an array
    @users.each do |user|
      if (user.role != 'user_minor') && (user.subscription_id == nil)
        users_to_remind_about_sub << user
      end
    end
    # Send an email to each users not minor nor subscriber
    mail(
      bcc: users_to_remind_about_sub.map(&:email).uniq,
      subject: "As-tu vu nos abonnements ?"
    )
  end
end
