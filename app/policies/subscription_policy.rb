class SubscriptionPolicy < ApplicationPolicy
  attr_reader :user, :subscription

  def initialize(user, subscription)
    @user = user
    @subscription = subscription
  end

  def new?
    user.role != 'user_minor'
  end

  def create?
    user.role != 'user_minor'
  end

end
