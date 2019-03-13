class CategoryPolicy < ApplicationPolicy
  # our authorization rules will go here
    attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def index?
  end

  def show?
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
    user.role == 'admin'
  end


end
