module ArticlesHelper

  def set_articles
    if @articles != nil
      if !user_signed_in? || current_user.role == 'user_minor'
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

  def article_clean

    if @articles != nil

      @second_article_text_raw = @articles.last(2).first.content.gsub(/<[^>]*>/, '')
      @second_article_text_raw_light = @second_article_text_raw.gsub(/&nbsp;/, ' ')

      @last_article_text_raw = @articles.last.content.gsub(/<[^>]*>/, '')
      @last_article_text_raw_light = @last_article_text_raw.gsub(/&nbsp;/, ' ')

    end
  end

end
