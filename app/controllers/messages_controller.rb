class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

def create
    @message = Message.new message_params

if @message.valid?
      UserMailer.contact_email_from_user(@message).deliver_now
      redirect_to new_message_url
      flash[:notice] = "Nous avons reçu votre message. Nous vous contacterons dès que possible"
    else
      flash[:notice] = "Une erreur est survenue durant l'envoi de votre message. Veuillez réessayer."
      render :new
    end
  end

private

def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end

end
