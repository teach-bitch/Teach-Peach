class SubscriptionsController < ApplicationController
  before_action :set_user
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
    @user.update(customer_id: @customer.id, subscription_id: subscription.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end

  def destroy
    sub = Stripe::Subscription.retrieve(@user.subscription_id)
      sub.delete
    @user.update(subscription_id: nil)
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_customer
    if @user.customer_id == nil
      @customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    else
      @customer = Stripe::Customer.retrieve(@user.customer_id)
    end
  end
end
