class ArticlePolicy < ApplicationPolicy
  # our authorization rules will go here
    attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def destroy?
    user.role == 'admin' || record.user == user
  end
end