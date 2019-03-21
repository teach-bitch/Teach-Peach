class StaticPagesController < ApplicationController
  before_action :set_user
  include ArticlesHelper

  def home
    set_articles
    article_clean
    @typeforms = Typeform.all
  end

  def contact
  end
    private

  def set_user
    @user = current_user
  end
end
