class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def index?
  end

  def show_article?
      user.role != 'user_minor'
  end

  def new?
    user.role == 'admin'
  end

  def edit?
    user.role == 'admin'
  end

  def create?
    user.role == 'admin'
  end

  def update?
    user.role == 'admin'
  end

  def destroy?
    user.role == 'admin' || article.user_id == user.id
  end

end
