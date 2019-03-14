class ChargesController < ApplicationController
  before_action :set_user, except: [:new]

  def new
  end

  def create
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    subscription = Stripe::Subscription.create({
      customer: customer.id,
      items: [
        {
          plan: 'plan_EgxsFHxvwjeTLV',
        },
      ],
    })

    @user.update(customer_id: customer.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def destroy
    sub = Stripe::Subscription.retrieve(@user.id)
      sub.delete
  end

  private

  def set_user
    @user = current_user
  end
end
