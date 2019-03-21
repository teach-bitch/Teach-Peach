class ImagesController < ApplicationController
  def create
    if params.include?('article_id')
      @article = Article.find(params[:article_id])
      @article.images.attach(params[:images])
      redirect_to(admins_article_path(@article))
    else
      @product = Product.find(params[:product_id])
      @product.images.attach(params[:images])
      redirect_to(admins_shop_product_path(@product))
    end
  end

end
