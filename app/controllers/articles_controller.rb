class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_visitor, except: [:index, :show]
  include ArticlesHelper

  def index
    set_articles
  end

  def show
    if (user_signed_in? && @article.for_adult == true)
      authorize @article, :show_article?
    else
      skip_authorization
      if @article.for_adult == true
        flash[:notice] = "Contenu pour adulte. Veuillez vous connecter pour y accéder."
        redirect_to root_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :for_adult, :role, images: [])
    end

end
