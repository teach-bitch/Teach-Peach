class User < ApplicationRecord
  #after_create :welcome_send

  enum role: [:admin, :user_minor, :user, :subscriber ]

  after_initialize do 
    if self.new_record?
      self.role ||= :user
    end
  end

  has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
