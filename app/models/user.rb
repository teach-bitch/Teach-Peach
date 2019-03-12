class User < ApplicationRecord
  #after_create :welcome_send

  enum role: [:visitor, :user_minor, :user, :subscriber, :admin]

  after_initialize do 
    if self.new_record?
      self.role ||= :visitor
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
