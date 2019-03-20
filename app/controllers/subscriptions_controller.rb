class SubscriptionsController < ApplicationController
  before_action :set_customer, only: [:create]

  def new
    authorize(:subscription, :new?)
  end

  def create
    authorize(:subscription, :create?)
    subscription = Stripe::Subscription.create({
      customer: @customer.id,
      items: [
        {
          plan: 'plan_EgxsFHxvwjeTLV',
        },
      ],
    })
    # After the Stripe request, store the subscription infos into users table
    current_user.update(customer_id: @customer.id, subscription_id: subscription.id, role: 'subscriber')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end

  def destroy
    sub = Stripe::Subscription.retrieve(current_user.subscription_id)
      sub.delete
    current_user.update(subscription_id: nil, role: 'user')
    redirect_to edit_user_registration_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

end
