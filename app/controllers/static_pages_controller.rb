class StaticPagesController < ApplicationController
  before_action :set_user
  
  def home
    @articles = Article.all
    @typeforms = Typeform.all
    @second_article_text_raw = Article.last(2).first.content.gsub(/<[^>]*>/, '') 
    @second_article_text_raw_light = @second_article_text_raw.gsub(/&nbsp;/, ' ') 

    @last_article_text_raw = Article.last.content.gsub(/<[^>]*>/, '') 
    @last_article_text_raw_light = @last_article_text_raw.gsub(/&nbsp;/, ' ') 
  end

    private

  def set_user
    @user = current_user
  end
end
