class ImagesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.images.attach(params[:images])
    redirect_to(admins_article_path(@article))
  end
end
