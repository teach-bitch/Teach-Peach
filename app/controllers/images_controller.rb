class ImagesController < ApplicationController
  def create
    puts '$' * 50
    puts 'ICI LA DEF CREATE DU IMAGESCONTROLLER'
    puts '$' * 50
    @article = Article.find(params[:article_id])
    @article.image.attach(params[:image])
    redirect_to(admins_article_path(@article))
  end
end
