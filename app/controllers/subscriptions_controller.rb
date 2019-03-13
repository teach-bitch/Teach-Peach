class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]

  def show
  end

  def new
  end

  def create
<<<<<<< HEAD
    Stripe::Customer.create(
      source: params[:stripeToken]
      plan: ""
    )
=======
>>>>>>> 8c0db5ef87ee0c6f8eb7fc27cc1e8d1ee5c43fc1
  end

  def destroy
  end

  private

    def redirect_to_signup
      if !user_signed_in?
        session["user_return_to"] = new_subscription_path
        redirect_to new_user_registration_path
      end
    end
end
