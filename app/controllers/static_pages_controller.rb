class StaticPagesController < ApplicationController
  before_action :set_user
  include StaticPagesHelper

  
  def home
    @articles = Article.all
    @typeforms = Typeform.all
    article_clean
  end

    private

  def set_user
    @user = current_user
  end
end
