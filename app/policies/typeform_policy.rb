class TypeformPolicy < ApplicationPolicy
  # our authorization rules will go here
    attr_reader :user, :typeform

  def initialize(user, typeform)
    @user = user
    @typeform = typeform
  end

  def index?
    user.role == 'admin'
  end

  def show?
    user.role == 'admin'
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