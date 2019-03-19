module ArticlesHelper
  def set_articles
    if current_user.role == 'user_minor'
      @articles = []
      Article.all.each do |article|
        if article.for_adult == false
          @articles << article
        end
      end
    else
      @articles = Article.all
    end
  end
end
