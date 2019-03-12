class ArticlePolicy < ApplicationPolicy
  # our authorization rules will go here
    attr_reader :user, :article

  def initialize(user, article)
    @user = current_user
    @article = article
  end

  def destroy?
    @user.role == 'admin'
  end
end