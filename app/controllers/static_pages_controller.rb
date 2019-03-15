class StaticPagesController < ApplicationController
  before_action :set_user
  
  def home
    @articles = Article.all
    @typeforms = Typeform.all
  end

    private

  def set_user
    @user = current_user
  end
end
